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