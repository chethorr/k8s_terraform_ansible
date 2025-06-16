output "master_cluster_ec2_ip" {
  description = "cluster nodes ip"
  value = aws_instance.cluster_ec2_mod.0.public_ip
}

output "worker1_cluster_ec2_ip" {
  description = "cluster nodes ip"
  value = aws_instance.cluster_ec2_mod.1.public_ip
}

output "worker2_cluster_ec2_ip" {
  description = "cluster nodes ip"
  value = aws_instance.cluster_ec2_mod.2.public_ip
}

output "cluster_ec2_id" {
  value = aws_instance.cluster_ec2_mod.*.id
}

output "cluster_ec2_az" {
  value = aws_instance.cluster_ec2_mod.*.availability_zone
}