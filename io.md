## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_source\_owner | AMI Source Owner | string | n/a | yes |
| bastion\_ami\_name\_pattern | Bastion's AMI Name Pattern | string | n/a | yes |
| bastion\_instance\_type | Bastion's instance type | string | `"t2.micro"` | no |
| bastion\_sg\_cidr | CIDR Range for inbound | list | `<list>` | no |
| bastion\_userdata | Path to userdata file | string | `""` | no |
| name | Bastion's instance name | string | n/a | yes |
| policy\_actions | List of IAM policy actions for the bastion | list | `<list>` | no |
| policy\_resources | List of IAM policy resources for the bastion | list | `<list>` | no |
| ssh\_key\_name | SSH Key name | string | n/a | yes |
| subnet\_name\_pattern | Subnet name for lookup | string | `""` | no |
| tags | Default tags | map | `<map>` | no |
| vpc\_name | VPC name for lookup | string | `""` | no |

