data "aws_ami" "bastion_ami" {
  filter {
    name = "name"

    values = [
      "${var.bastion_ami_name_pattern}",
    ]
  }

  owners = [
    "${var.ami_source_owner}",
  ]

  most_recent = true
}

data "template_file" "bastion_userdata" {
  template = "${local.userdata}"
}



data "aws_subnet_ids" "subnet" {
  vpc_id = "${data.aws_vpc.vpc.id}"
  filter {
    name = "tag:Name"
    values = ["${var.subnet_name_pattern}"]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"

    values = [
      "${var.vpc_name}",
    ]
  }
}


data "aws_iam_policy_document" "instance_profile" {
  statement {
    sid = "InstanceProfile"

    resources = [
      "${var.policy_resources}",]

    actions = [
      "${var.policy_actions}"]

    effect = "Allow"
  }
}
data "external" "ssh-key" {
  program = [
    "${path.module}/sshkey.sh",
    "${var.ssh_key_name}",
  ]
}
