locals {
  userdata = "${var.bastion_userdata == "" ? file("${path.module}/userdata.sh") : var.bastion_userdata}"
}

variable "bastion_userdata" {
  default = ""
}

variable "bastion_ami_name_pattern" {
  description = "Bastion's AMI Name Pattern"
}

variable "ami_source_owner" {
  description = "AMI Source Owner"
}
variable "subnet_name_pattern" {
  default = ""
}

variable "bastion_instance_type" {
  default = "t2.micro"
}

variable "name" {}

variable "ssh_key_name" {}

variable "bastion_sg_cidr" {
  default = []
  type = "list"
}

variable "vpc_name" {
  default = ""
}

variable "tags" {
  default = {}
  type = "map"
}

variable "policy_resources" {
  default = []
  type = "list"
}

variable "policy_actions" {
  default = []
  type = "list"
}

variable "associate_public_ip_address" {
  default = "true"
}

