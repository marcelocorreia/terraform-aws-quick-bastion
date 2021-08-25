<!-- Auto generated file, please refer to README.yml -->
# terraform-aws-quick-bastion
[![logo]](https://git.health.nsw.gov.au/ehnsw-clinicalapps/module-aws-quick-bastion)
---
[![shield](https://img.shields.io/github/release/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)](https://img.shields.io/github/release/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)
[![shield](https://img.shields.io/github/languages/count/marcelocorreia/terraform-aws-quick-bastion.svg)](https://img.shields.io/github/languages/count/marcelocorreia/terraform-aws-quick-bastion.svg)
[![shield](https://img.shields.io/github/languages/top/marcelocorreia/terraform-aws-quick-bastion.svg?logo=amazon-aws)](https://img.shields.io/github/languages/top/marcelocorreia/terraform-aws-quick-bastion.svg?logo=amazon-aws)
---
### TLDR;
- [Overview](#overview)
- [Description](#description)
- [Usage](#usage)
- [Inputs](#terraform.md)


### Overview
A quick customisable bastion...



### Usage
```hcl-terraform
variable "stack_name" {
  description = "Stack name"
}
variable "policy_actions" {
  default = []
}
variable "policy_resources" {
  default = []
}
variable "aws_region" {
  default = "ap-southeast-2"
}
variable "environment" {
  description = "Environment"
}
variable "organisation" {
  default     = "health"
  description = "Organisation"
}
variable "ami_id" {
  description = "AMI ID"
}

variable "subnet_id" {
  description = "Subnet id"
}
variable "vpc_id" {
  description = "VPC ID"
}

module "bastion" {
  source    = "../"
  name      = var.stack_name
  subnet_id = var.subnet_id
  vpc_id    = var.vpc_id
  ami_id    = var.ami_id
  userdata  = data.template_file.userdata.rendered

  tags = {
    ENVIRONMENT  = var.environment
    ORGANISATION = var.organisation
    STACK_NAME   = var.stack_name
  }

  policy_resources = var.policy_resources

  policy_actions = var.policy_actions
}
```
#### .TFVARS example
```hcl
stack_name  = "esb-bastion"
subnet_id   = "subnet-0f2ZXZXZXZX33"
vpc_id      = "vpc-XZXZXZXZXd16d5"
ami_id      = "ami-ZCXZCZCZCZb40c33a2"
environment = "dev"
policy_resources = [
  "*",
]

policy_actions = [
  "s3:*",
  "ec2:*",
]
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [template_file.bastion_userdata](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `any` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Associate Public IP address | `bool` | `true` | no |
| <a name="input_bastion_sg_cidr"></a> [bastion\_sg\_cidr](#input\_bastion\_sg\_cidr) | CIDR Range for inbound | `list` | `[]` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Bastion's instance type | `string` | `"t2.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Bastion's instance name | `any` | n/a | yes |
| <a name="input_policy_actions"></a> [policy\_actions](#input\_policy\_actions) | List of IAM policy actions for the bastion | `list` | `[]` | no |
| <a name="input_policy_resources"></a> [policy\_resources](#input\_policy\_resources) | List of IAM policy resources for the bastion | `list` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map` | `{}` | no |
| <a name="input_userdata"></a> [userdata](#input\_userdata) | Path to userdata file | `string` | `""` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_arn"></a> [bastion\_arn](#output\_bastion\_arn) | n/a |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |
| <a name="output_instance_profile"></a> [instance\_profile](#output\_instance\_profile) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | n/a |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | n/a |
| <a name="output_role_name"></a> [role\_name](#output\_role\_name) | n/a |



    
<!-- -->


[logo]: https://i2.wp.com/killscreen.com/wp-content/uploads/2016/08/bastion-gameplay.jpg?fit=700%2C396&ssl=1
