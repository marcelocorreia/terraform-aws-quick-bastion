## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_source\_owner | AMI Source Owner | string | n/a | yes |
| associate\_public\_ip\_address |  | string | `"true"` | no |
| bastion\_ami\_name\_pattern | Bastion's AMI Name Pattern | string | n/a | yes |
| bastion\_instance\_type |  | string | `"t2.micro"` | no |
| bastion\_sg\_cidr |  | list | `<list>` | no |
| bastion\_userdata |  | string | `""` | no |
| name |  | string | n/a | yes |
| policy\_actions |  | list | `<list>` | no |
| policy\_resources |  | list | `<list>` | no |
| random\_length |  | string | `"2"` | no |
| ssh\_create\_key |  | string | `"true"` | no |
| ssh\_key\_name |  | string | n/a | yes |
| ssh\_key\_path |  | string | `""` | no |
| subnet\_name\_pattern |  | string | `""` | no |
| tags |  | map | `<map>` | no |
| vpc\_name |  | string | `""` | no |

