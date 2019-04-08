resource "aws_instance" "bastion" {
  ami = "${data.aws_ami.bastion_ami.id}"
  instance_type = "${var.bastion_instance_type}"
  //  count         = "${var.generate_new_key?0:1}"

  vpc_security_group_ids = [
    "${aws_security_group.bastion.id}",
  ]

  subnet_id = "${data.aws_subnet_ids.subnet.ids[0]}"
  key_name = "${var.ssh_key_name}"
  user_data = "${data.template_file.bastion_userdata.rendered}"
  iam_instance_profile = "${aws_iam_instance_profile.deployment.id}"
  associate_public_ip_address = "${var.associate_public_ip_address}"

  tags = "${merge(var.tags,map("Name",var.name))}"
}

resource "aws_iam_role" "instance_profile" {
  //  name = "${var.name}"
  description = "${var.name}"
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

  tags = "${merge(var.tags,map("Name",var.name))}"
}

resource "aws_security_group" "bastion" {
  name = "${var.name}"
  description = "${var.name}"
  vpc_id = "${data.aws_vpc.vpc.id}"

  ingress {
    from_port = 0
    protocol = "-1"
    to_port = 0

    cidr_blocks = [
      "${var.bastion_sg_cidr}",
    ]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }


  tags = "${merge(var.tags,map("Name",var.name))}"
}

resource "aws_iam_policy" "instance_profile" {
  //  name = "mcBastionAssume"
  policy = "${data.aws_iam_policy_document.instance_profile.json}"
}

resource "aws_iam_instance_profile" "deployment" {
  role = "${aws_iam_role.instance_profile.name}"
  //  name = "${var.name}"
}

resource "aws_key_pair" "keypair" {
  count = "${var.ssh_create_key ? 1 : 0}"
  public_key = "${data.external.ssh-key.result.public}"
  key_name = "${var.ssh_key_name}"
}

variable "ssh_create_key" {
  default = true
}

variable "ssh_key_path" {
  default = ""
}

variable "random_length" {
  default = "2"
}

resource "random_pet" "ssh_random_name" {
  separator = "-"
  length = "${var.random_length}"
  keepers = {
    ami_id = "${aws_instance.bastion.id}"
  }
}