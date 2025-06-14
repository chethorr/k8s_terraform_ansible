output "nfs_ec2_ip" {
  description = "nfs ip"
  value = aws_instance.nfs_ec2_mod.public_ip
}