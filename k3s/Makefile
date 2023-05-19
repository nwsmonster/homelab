.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

env ?= "prod"

default: site

site:
	ansible-playbook \
		--inventory inventories/${env}/hosts.ini \
		site.yml -K

reset:
	ansible-playbook \
		--inventory inventories/${env}/hosts.ini \
		reset.yml -K
