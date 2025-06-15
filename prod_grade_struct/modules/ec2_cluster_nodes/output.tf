output "cluster_ec2_ip" {
  description = "cluster nodes ip"
  value = aws_instance.cluster_ec2_mod.*.public_ip
}

output "cluster_ec2_id" {
  value = aws_instance.cluster_ec2_mod.id
}

output "cluster_ec2_az" {
  value = aws_instance.cluster_ec2_mod.*.availability_zone
}