.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

env ?= "prod"

default: site

site:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		site.yml

reset:
	ansible-playbook \
		--inventory inventories/${env}.yml \
		reset.yml
