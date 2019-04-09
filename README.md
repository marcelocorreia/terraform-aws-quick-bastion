<!-- Auto generated file, please refer to README.yml -->
# terraform-aws-quick-bastion
[![Badwolf][logo]](https://your.website.com)
---
[![shield](https://img.shields.io/github/forks/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)](https://img.shields.io/github/forks/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)
[![shield](https://img.shields.io/github/release/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)](https://img.shields.io/github/release/marcelocorreia/terraform-aws-quick-bastion.svg?flat-square)
---
### TLDR;
- [Overview](#overview)
- [Description](#description)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [License](#license)

### Overview
TODO:// Overview


### Description
A quick bastion...





### Usage
```hcl-terraformprovider "aws" {
  region = "ap-southeast-2"
}

module "bastion" {
  source           = "../"
  ami_source_owner = "122455764658"
  vpc_name         = "my-vpc"
  ssh_key_name     = "my-key"

  bastion_sg_cidr = [
    "1.2.3.4/32",
  ]

  subnet_name_pattern      = "subnet*public*a"
  bastion_ami_name_pattern = "ubuntu-base-*"
  name                     = "bastion"

  policy_resources = [
    "*",
  ]

  policy_actions = [
    "s3:*",
  ]

  bastion_userdata = "${file("custom_userdata.sh")}"
}

// Creating a new SSH Key
module "ssh_key" {
  source     = "git::https://github.com/marcelocorreia/terraform-aws-keypair.git?ref=master"
  key_name   = "bastion"
  key_path   = "/tmp/bastion"
  create_key = true
}

module "bastion2" {
  source           = "../"
  ami_source_owner = "122455764658"
  vpc_name         = "my-vpc"
  ssh_key_name     = "${module.ssh_key.key_name}"

  bastion_sg_cidr = [
    "1.2.3.4/32"
  ]

  subnet_name_pattern      = "subnet*public*a"
  bastion_ami_name_pattern = "ubuntu-base-*"
  name                     = "bastion"

  policy_resources = [
    "*",
  ]

  policy_actions = [
    "s3:*",
  ]

  bastion_userdata = "${file("custom_userdata.sh")}"
}



```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami\_source\_owner | AMI Source Owner | string | n/a | yes |
| associate\_public\_ip\_address | Associate Public IP address | string | `"true"` | no |
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



<!-- Apache License -->
### License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

Copyright [2015] 

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
    
<!-- -->


[logo]: https://i2.wp.com/killscreen.com/wp-content/uploads/2016/08/bastion-gameplay.jpg?fit=700%2C396&ssl=1

[docs]: https://your.docs.com

[github]: https://github.com/marcelocorreia

[linkedin]: https://www.linkedin.com/in/marcelocorreia/

[website]: https://your.website.com

[slack]: https://your.slack.com/

[email]: EMAIL@CHANGE.ME


