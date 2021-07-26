
data "template_file" "bastion_userdata" {
  template = var.userdata == "" ? local.userdata_default : var.userdata
}



