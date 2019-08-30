locals {
  userdata_default = file(format("%s/%s", path.module, "/userdata.sh"))
}

variable "associate_public_ip_address" {
  default     = true
  description = "Associate Public IP address"
}

variable "bastion_userdata" {
  default     = ""
  description = "Path to userdata file"
}

variable "bastion_ami_name_pattern" {
  description = "Bastion's AMI Name Pattern"
}

variable "ami_source_owner" {
  description = "AMI Source Owner"
}

variable "subnet_name_pattern" {
  default     = ""
  description = "Subnet name for lookup"
}

variable "bastion_instance_type" {
  default     = "t2.micro"
  description = "Bastion's instance type"
}

variable "name" {
  description = "Bastion's instance name"
}

variable "ssh_key_name" {
  description = "SSH Key name"
  default     = ""
}

variable "bastion_sg_cidr" {
  default     = []
  type        = "list"
  description = "CIDR Range for inbound"
}

variable "vpc_name" {
  default     = ""
  description = "VPC name for lookup"
}

variable "tags" {
  default     = {}
  type        = "map"
  description = "Default tags"
}

variable "policy_resources" {
  default     = []
  type        = "list"
  description = "List of IAM policy resources for the bastion"
}

variable "policy_actions" {
  default     = []
  type        = "list"
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