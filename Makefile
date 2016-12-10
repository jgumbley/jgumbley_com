define green
	@tput setaf 2; echo $1; tput sgr0;
endef

MACHINE_IP=$(shell cd terraform; terraform output ip)

.PHONY: setup
setup: terraform
	cd ansible; ansible-playbook -c local setup.yml

.PHONY: terraform
terraform:
	cd terraform; terraform apply
	$(call green,"[All steps successful]")

.PHONY: app
app:
	$(call green,"[App built]")

.PHONY: clean
clean:
	cd terraform; terraform destroy -force
	$(call green,"[All steps successful]")


