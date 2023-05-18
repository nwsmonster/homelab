.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

default: bootstrap

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

bootstrap:
	make -C bootstrap

delete-argocd:
	kubectl delete namespace argocd
	kubectl delete crd applications.argoproj.io
	kubectl delete crd applicationsets.argoproj.io
	kubectl delete crd appprojects.argoproj.io

whoami:
	make -C experiments/whoami

delete-whoami:
	make -C experiments/whoami delete
