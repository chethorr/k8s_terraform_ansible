output "vpc_qa_id" {
  value = module.vpc.vpc_mod_id
}

output "subnet_qa_id" {
  value = module.subnet.subnet_mod_id
}

output "subnet_qa_cidr" {
  value = module.subnet.subnet_mod_cidr
}

output "ec2_ansible_ip" {
  value = module.ansible.ansible_ec2_ip
}

output "ec2_nfs_ip" {
  value = module.nfs.nfs_ec2_ip
}

output "master_ec2_cluster_nodes_ip" {
  value = module.cluster.master_cluster_ec2_ip
}

output "worker1_ec2_cluster_nodes_ip" {
  value = module.cluster.worker1_cluster_ec2_ip
}

output "worker2_ec2_cluster_nodes_ip" {
  value = module.cluster.worker2_cluster_ec2_ip
}

