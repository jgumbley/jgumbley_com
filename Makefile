define green
	@tput setaf 2; echo $1; tput sgr0;
endef

MACHINE_IP=$(shell cd terraform; terraform output ip)

.PHONY: setup
setup: terraform
	cd ansible; ansible-playbook -c local setup.yml

.PHONY: terraform
terraform: deploy_key
	cd terraform; terraform apply
	$(call green,"[All steps successful]")

.PHONY: app
app:
	$(call green,"[App built]")

deploy_key:
	ssh-keygen -t rsa -b 4096 -C "$(shell whoami)@jimssolution" -f ./deploy_key

.PHONY: clean
clean:
	cd terraform; terraform destroy -force
	$(call green,"[All steps successful]")

.PHONY: mrsparkle
mrsparkle: clean
	rm deploy_key deploy_key.pub
	$(call green,"[All steps successful]")

.PHONY: ssh
ssh:
	ssh -i deploy_key ec2-user@$(MACHINE_IP)

.PHONY: log
log:
	ssh -i deploy_key ec2-user@$(MACHINE_IP) 'sudo tail -f /var/log/firehose'


