#!/usr/bin/env bash

VALUES="Values.yaml"

kubectl get ingress gitea --namespace gitea || true

helm template \
  --include-crds \
  --namespace argocd \
  --values "${VALUES}" \
  argocd . | kubectl apply -n argocd -f -
