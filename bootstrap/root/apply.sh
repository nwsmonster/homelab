#!/usr/bin/env bash

VALUES="values.yaml"

helm template \
  --include-crds \
  --namespace argocd \
  --values "${VALUES}" \
  argocd . | kubectl apply -n argocd -f -
