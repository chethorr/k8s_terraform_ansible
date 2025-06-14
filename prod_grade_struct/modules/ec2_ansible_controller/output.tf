output "ansible_ec2_ip" {
  description = "ansible controller ip"
  value = aws_instance.ansible_ec2_mod.public_ip
}