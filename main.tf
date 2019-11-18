resource "aws_instance" "bastion" {
  ami           = data.aws_ami.bastion_ami.id
  instance_type = var.bastion_instance_type

  vpc_security_group_ids = [
    aws_security_group.bastion.id,
  ]

  subnet_id                   = var.subnet_id
  key_name                    = var.ssh_key_name != "" ? var.ssh_key_name : aws_key_pair.keypair[0].key_name
  user_data                   = data.template_file.bastion_userdata.rendered
  iam_instance_profile        = aws_iam_instance_profile.deployment.id
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(var.tags, map("Name", var.name))
}

resource "aws_iam_role" "instance_profile" {
  name        = var.name
  description = var.name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": "assume"
    }
  ]
}
EOF

  tags = merge(var.tags, map("Name", var.name))
}

resource "aws_security_group" "bastion" {
  name        = var.name
  description = var.name
  vpc_id      = var.vpc_id

  ingress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0

    cidr_blocks = var.bastion_sg_cidr

  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  tags = merge(var.tags, map("Name", var.name))
}



resource "aws_iam_policy" "instance_profile" {
  name = var.name
  policy = data.aws_iam_policy_document.instance_profile.json
}

resource "aws_iam_instance_profile" "deployment" {
  role = aws_iam_role.instance_profile.name
  name = var.name
}

resource "tls_private_key" "keypair" {
  count     = var.ssh_key_name != "" ? 0 : 1
  algorithm = "RSA"
}

resource "aws_key_pair" "keypair" {
  count      = var.ssh_key_name != "" ? 0 : 1
  public_key = tls_private_key.keypair[0].public_key_openssh
  key_name   = "${var.name}-key-pair"
}

