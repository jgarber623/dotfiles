.PHONY: all, boostrap, provision

all: bootstrap provision

bootstrap:
	@echo '=> Running bootstrap script...'
	@sh ./scripts/bootstrap.sh

provision:
	@echo '=> Running provisioning scripts with Ansible...'
	ansible-playbook --ask-become-pass --diff playbook.yml
