output "security_group_id" {
  value = aws_security_group.bastion_group.id
}

output "instance_id" {
  value = aws_instance.bastion.id
}
