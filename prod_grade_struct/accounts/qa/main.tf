module "vpc" {
  source = "../../modules/vpc"

  name           = var.qa_name
  cidr_block_mod = var.vpc_qa_cidr
}

module "subnet" {
  source = "../../modules/subnets"

  vpc_id              = module.vpc.vpc_mod_id
  igw_id              = module.vpc.igw_mod_id
  pub_subnet_mod_az   = var.subnet_qa_az
  pub_subnet_mod_cidr = var.subnet_qa_cidr
  name                = var.qa_name
}

module "sg" {
  source            = "../../modules/security_groups"
  sg_name           = "onprem" #change after wards
  sg_vpc_id         = module.vpc.vpc_mod_id
  sg_ports_inbound  = [80, 443, 22]
  sg_ports_outbound = [80, 443, 22]
}

module "key" {
  source          = "../../modules/key_pair"
  public_key_path = var.public_key
  key_name        = var.key_name
}

module "nfs" {
  source                    = "../../modules/nfs_node"
  ec2_name                  = var.nfs_name
  vpc_sg_id                 = module.sg.sg_mod_id
  subnet_id                 = module.subnet.subnet_mod_id[0]
  key_pair                  = module.key.key_mod_name
  nfs_ec2_ami_id            = var.ami_common
  nfs_ec2_instance_type     = var.instance_type_common
  ebs_delete_on_termination = var.ebs_delete
  ebs_device_name           = var.ebs_dev_name
  ebs_volume_size_gb        = var.ebs_vol_size
}

module "ansible" {
  source                    = "../../modules/ec2_ansible_controller"
  ec2_name                  = var.ansible_name
  vpc_sg_id                 = module.sg.sg_mod_id
  subnet_id                 = module.subnet.subnet_mod_id[1]
  key_pair                  = module.key.key_mod_name
  ansible_ec2_ami_id        = var.ami_common
  ansible_ec2_instance_type = var.instance_type_common
  ebs_delete_on_termination = var.ebs_delete
  ebs_device_name           = var.ebs_dev_name
  ebs_volume_size_gb        = var.ebs_vol_size
  depends_on                = [module.nfs]
}


locals {
  # This creates a map where keys are "subnet-0", "subnet-1", etc.,
  # and values are the corresponding subnet IDs from the network module.
  # Example output for 'subnet_map_for_iteration' if network module provides 3 subnets:
  # {
  #   "subnet-0": "subnet-id-from-first-az",
  #   "subnet-1": "subnet-id-from-second-az",
  #   "subnet-2": "subnet-id-from-third-az"
  # }
  subnet_map_for_iteration = {
    for i, id in module.subnet.subnet_mod_id : "subnet-${i}" => id
  }

  # ebs_vol_rem = [
  #   "${module.ebs_vol.ebs_id[2]}",
  #   "${module.ebs_vol.ebs_id[3]}",
  #   "${module.ebs_vol.ebs_id[4]}",
  # ]

}

module "cluster" {
  source                    = "../../modules/ec2_cluster_nodes"
  ec2_name                  = var.cluster_name
  vpc_sg_id                 = module.sg.sg_mod_id
  for_each                  = local.subnet_map_for_iteration
  subnet_id                 = each.value
  key_pair                  = module.key.key_mod_name
  cluster_ec2_ami_id        = var.ami_common
  cluster_ec2_instance_type = var.instance_type_common
  ebs_delete_on_termination = var.ebs_delete
  ebs_device_name           = var.ebs_dev_name
  ebs_volume_size_gb        = var.ebs_vol_size
  depends_on                = [module.ansible, module.nfs]
}

locals {
  ec2_cluster_ip = [for i, ip in module.cluster : ip.cluster_ec2_ip]
}


