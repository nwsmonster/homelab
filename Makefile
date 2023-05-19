.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

default: bootstrap post-install

python-deps:
	@./scripts/check-binary.sh python
	@./scripts/check-binary.sh pip
	pip install -r requirements.txt

docs:
	mkdocs build

clean:
	@rm -rf $(shell pwd)/site
	@echo "done"

k3s:
	make -C k3s

reset-k3s:
	make -C k3s reset

bootstrap:
	make -C bootstrap

bootstrap-argocd:
	make -C bootstrap argocd

bootstrap-argocd-root:
	make -C bootstrap root

post-install:
	python3 ./scripts/hacks

delete-argocd:
	kubectl delete namespace argocd 2> /dev/null || true
	kubectl delete crd applications.argoproj.io 2> /dev/null || true
	kubectl delete crd applicationsets.argoproj.io 2> /dev/null || true
	kubectl delete crd appprojects.argoproj.io 2> /dev/null || true

whoami:
	make -C experiments/whoami

delete-whoami:
	make -C experiments/whoami delete
