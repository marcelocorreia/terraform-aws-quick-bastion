data "aws_ami" "bastion_ami" {
  filter {
    name = "name"

    values = [
      var.bastion_ami_name_pattern,
    ]
  }

  owners = [
    var.ami_source_owner,
  ]

  most_recent = true
}

data "template_file" "bastion_userdata" {
  template = var.bastion_userdata == "" ? local.userdata_default : var.bastion_userdata
}

data "external" "keypair_pub" {
  count = var.ssh_key_name != "" ? 0 : 1

  program = [
    "${path.module}/keys.sh",
    tls_private_key.keypair[0].public_key_openssh,
    tls_private_key.keypair[0].private_key_pem,
    "${path.root}/keys",
    var.name
  ]

}

data "aws_iam_policy_document" "instance_profile" {
  statement {
    sid       = "InstanceProfile"
    resources = var.policy_resources
    actions   = var.policy_actions
    effect    = "Allow"
  }

}
