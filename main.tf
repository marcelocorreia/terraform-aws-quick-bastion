resource "aws_instance" "bastion" {
  ami           = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [
    aws_security_group.bastion.id,
  ]
  key_name = var.ssh_keypair
  subnet_id                   = var.subnet_id
  user_data                   = data.template_file.bastion_userdata.rendered
  iam_instance_profile        = aws_iam_instance_profile.deployment.id
  associate_public_ip_address = var.associate_public_ip_address

  tags = merge(var.tags, { "Name" : var.name })
}



resource "aws_iam_role" "instance_profile" {
  name                = var.name
  description         = var.name

  managed_policy_arns =var.managed_policy_arns
  assume_role_policy  = <<EOF
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

  tags = merge(var.tags, { "Name" : var.name })
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

  tags = merge(var.tags, {
    "Name" : var.name
  })
}

resource "aws_iam_instance_profile" "deployment" {
  role = aws_iam_role.instance_profile.name

}

resource "aws_iam_policy" "bastion" {
  name_prefix = var.name
  policy = data.aws_iam_policy_document.bastion.json
}

resource "aws_iam_policy_attachment" "bastion" {
  name = aws_iam_policy.bastion.name
  policy_arn = aws_iam_policy.bastion.arn
  roles = [aws_iam_role.instance_profile.name]
}