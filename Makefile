AWS_PROFILE ?= badwolf-labs


init: _creds fmt
	cd example && terraform init
get:
	cd example && terraform get

plan: _creds init
	cd example && terraform plan

apply: _creds
	cd example && terraform apply --auto-approve

destroy: _creds init empty-logs-bucket
	cd example && terraform destroy --auto-approve

state:
	cd example && terraform state list
fmt:
	terraform fmt

_creds:
	$(eval export AWS_PROFILE=$(AWS_PROFILE))

_sleep:
	cowsay -f mario Waiting $(WAIT_FOR_STACK) seconds, Hope the stack will be up...
	sleep $(WAIT_FOR_STACK)



