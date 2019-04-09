provider "aws" {
  region = "ap-southeast-2"
}

module "ssh_key" {
  source     = "git::https://github.com/marcelocorreia/terraform-aws-keypair.git?ref=master"
  key_name   = "bastion"
  key_path   = "/tmp/bastion"
  create_key = true
}

module "bastion" {
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
