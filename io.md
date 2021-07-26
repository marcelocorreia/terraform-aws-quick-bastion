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
