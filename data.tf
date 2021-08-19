
data "template_file" "bastion_userdata" {
  template = var.userdata == "" ? local.userdata_default : var.userdata
}

data "aws_iam_policy_document" "bastion" {
  statement {
    actions = var.policy_actions
    resources = var.policy_resources
  }
}

