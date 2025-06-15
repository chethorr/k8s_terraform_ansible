output "nfs_ec2_ip" {
  description = "nfs ip"
  value = aws_instance.nfs_ec2_mod.public_ip
}

output "nfs_ec2_id" {
  value = aws_instance.nfs_ec2_mod.id
}

output "nfs_ec2_az" {
  value = aws_instance.nfs_ec2_mod.availability_zone
}