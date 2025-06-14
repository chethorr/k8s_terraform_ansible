output "cluster_ec2_ip" {
  description = "cluster nodes ip"
  value = aws_instance.cluster_ec2_mod.public_ip
}