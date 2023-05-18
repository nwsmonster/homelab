.POSIX:

default: namespace argocd

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml | kubectl apply -f -

.PHONY: argocd
argocd:
	cd argocd && ./apply.sh

.PHONY: argocd-password
argocd-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d >> $(shell pwd)/argocd/password

.PHONY: root
root:
	cd root && ./apply.sh
