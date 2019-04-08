provider "aws" {
  region = "ap-southeast-2"
}

//module "example" {
//  source = "../"
//}
//

module "bastion" {
  source = "../"
  ami_source_owner = "123456789012"
  vpc_name = "my-vpcnetwork"
  ssh_key_name = "my-key"
  bastion_sg_cidr = [
    "1.2.3.4/32",
   ]
  subnet_name_pattern = "subnet*public*a"
  bastion_ami_name_pattern = "ubuntu-base-*"
  name = "bastion"
  policy_resources = ["*"]
  policy_actions = ["s3:*"]
}
