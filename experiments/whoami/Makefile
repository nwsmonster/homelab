.POSIX:

default: namespace whoami

namespace:
	kubectl create namespace whoami --dry-run=client --output=yaml | kubectl apply -f -

.PHONY: whoami
whoami:
	kubectl apply -f whoami.yaml

.PHONY: delete
delete:
	kubectl delete namespace whoami
