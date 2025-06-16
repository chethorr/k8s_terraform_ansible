resource "local_file" "ansible_inventory" {
  content = templatefile(
    "${path.module}/inventory.ini.tpl", {
      master_node_ip  = "${module.cluster.master_cluster_ec2_ip}"
      worker_node1_ip = "${module.cluster.worker1_cluster_ec2_ip}"
      worker_node2_ip = "${module.cluster.worker2_cluster_ec2_ip}"
      nfs_server = "${module.nfs.nfs_ec2_mod.public_ip}"
    }
  )
  filename = "${path.module}/inventory.ini"
  depends_on = [ module.cluster ]
}
