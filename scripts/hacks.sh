#!/usr/bin/env bash

# Quick and dirty script for things that I can't/don't have time to do properly yet
# TODO: retire this script

# shellcheck source=source.sh
source "$(dirname "${BASH_SOURCE[0]}")/source.sh"

function extract_argocd_pass() {
  local pass secret_name
  secret_name=argocd-initial-admin-secret
  pass=$(kubectl -n argocd get secret $secret_name -o jsonpath="{.data.password}" 2> /dev/null)
  # shellcheck disable=SC2181
  [ ! $? = 0 ] && echo "$secret_name does not exist"
  [ -n "$pass" ] && echo "$pass" | base64 -d > "$1"
}

function main() {
  local argocd_password_file
  argocd_password_file="${PROJECT_DIR}/bootstrap/argocd/password"
  rm -rf "$argocd_password_file"
  extract_argocd_pass "$argocd_password_file"
  [ ! -f "$argocd_password_file" ] && echo "trying again..." && sleep 3 && extract_argocd_pass "$argocd_password_file"
  [ ! -f "$argocd_password_file" ] && echo "failed to extract argocd password" && exit 1
}

main "$@"
