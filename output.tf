output "public_ip" {
  value = aws_instance.bastion.public_ip
}

output "private_ip" {
  value = aws_instance.bastion.private_ip
}

output "private_dns" {
  value = aws_instance.bastion.private_dns
}

output "public_dns" {
  value = aws_instance.bastion.public_dns
}

output "instance_profile" {
  value = aws_iam_instance_profile.deployment.name
}

output "role_arn" {
  value = aws_iam_role.instance_profile.arn
}

output "role_name" {
  value = aws_iam_role.instance_profile.name
}

output "bastion_arn" {
  value = aws_instance.bastion.arn
}

output "instance_id" {
  value = aws_instance.bastion.id
}