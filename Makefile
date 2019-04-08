AWS_PROFILE ?= lone


init: _creds
	cd example && terraform init

plan: _creds init
	cd example && terraform plan --var allowed_ips_cidr=$(ALLOWED_IPS_CIDR)

apply: _creds
	cd example && terraform apply --auto-approve --var allowed_ips_cidr=$(ALLOWED_IPS_CIDR)

destroy: _creds init empty-logs-bucket
	cd example && terraform destroy --auto-approve --var allowed_ips_cidr=$(ALLOWED_IPS_CIDR)

state:
	cd example && terraform state list


_creds:
	$(eval export AWS_PROFILE=$(AWS_PROFILE))

_sleep:
	cowsay -f mario Waiting $(WAIT_FOR_STACK) seconds, Hope the stack will be up...
	sleep $(WAIT_FOR_STACK)



