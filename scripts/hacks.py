#!/usr/bin/env python

"""
Quick and dirty script for things that I can't/don't have time to do properly yet
TODO: retire this script
"""

import base64
import json
import requests
import sys
import urllib

from rich.console import Console
from kubernetes import client, config

# Doing this properly inside the cluster requires:
# - Kubernetes service account
# - Vault Kubernetes auth
config.load_kube_config(config_file='./kubeconfig.yaml')

gitea_host = client.NetworkingV1Api().read_namespaced_ingress('gitea', 'gitea').spec.rules[0].host
gitea_user = base64.b64decode(client.CoreV1Api().read_namespaced_secret('gitea-admin-secret', 'gitea').data['username']).decode("utf-8")
gitea_pass = base64.b64decode(client.CoreV1Api().read_namespaced_secret('gitea-admin-secret', 'gitea').data['password']).decode("utf-8")
gitea_url = f"http://{gitea_user}:{urllib.parse.quote_plus(gitea_pass)}@{gitea_host}"

vault_host = client.NetworkingV1Api().read_namespaced_ingress('vault', 'vault').spec.rules[0].host
vault_token = base64.b64decode(client.CoreV1Api().read_namespaced_secret('vault-unseal-keys', 'vault').data['vault-root']).decode("utf-8")
vault_url = f"https://{vault_host}"


def create_vault_secret(path: str, data) -> None:
    requests.post(
        url=f"{vault_url}/v1/secret/data/{path}",
        headers={
            'X-Vault-Token': vault_token
        },
        data=json.dumps({
            'data': data
        })
    )


def setup_gitea_access_token(name: str) -> None:
    current_tokens = requests.get(
        url=f"{gitea_url}/api/v1/users/{gitea_user}/tokens",
    ).json()

    if not any(token['name'] == name for token in current_tokens):
        resp = requests.post(
            url=f"{gitea_url}/api/v1/users/{gitea_user}/tokens",
            headers={
                'Content-Type': 'application/json'
            },
            data=json.dumps({
                'name': name
            })
        )

        if resp.status_code == 201:
            create_vault_secret(
                f"gitea/{name}",
                {
                    'token': resp.json()['sha1']
                }
            )
        else:
            print(f"Error creating access token {name} ({resp.status_code})")
            print(resp.content)
            sys.exit(1)


def main() -> None:

    with Console().status("Completing the remaining sorcery"):
        gitea_access_tokens = [
            'renovate'
        ]

        for token_name in gitea_access_tokens:
            setup_gitea_access_token(token_name)


if __name__ == '__main__':
    main()
