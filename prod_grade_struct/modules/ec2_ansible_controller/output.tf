output "ansible_ec2_ip" {
  description = "ansible controller ip"
  value = aws_instance.ansible_ec2_mod.public_ip
}

output "ansible_ec2_id" {
  value = aws_instance.ansible_ec2_mod.id
}

output "ansible_ec2_az" {
  value = aws_instance.ansible_ec2_mod.availability_zone
}