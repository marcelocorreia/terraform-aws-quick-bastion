locals {
  userdata_default = file(format("%s/%s", path.module, "/userdata.sh"))
}
variable "managed_policy_arns" {
  default = []
}

variable "associate_public_ip_address" {
  default     = false
  description = "Associate Public IP address"
}

variable "userdata" {
  default     = ""
  description = "Path to userdata file"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Bastion's instance type"
}

variable "name" {
  description = "Bastion's instance name"
}

variable "bastion_sg_cidr" {
  default     = []
  description = "CIDR Range for inbound"
}


variable "tags" {
  default     = {}
  description = "Default tags"
}

variable "policy_resources" {
  default = []

  description = "List of IAM policy resources for the bastion"
}

variable "ami_id" {}

variable "policy_actions" {
  default = []

  description = "List of IAM policy actions for the bastion"
}
variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}