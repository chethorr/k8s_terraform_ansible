variable "qa_name" {
  description = "qa vpc name"
}

variable "vpc_qa_cidr" {
  description = "qa vpc cidr"
}

variable "subnet_qa_az" {
  description = "qa subnet az"
}

variable "subnet_qa_cidr" {
  description = "qa subnet cidr"
}

variable "ebs_availability_zone" {
  description = "ebs az zone"
}

variable "ebs_name" {
  description = "ebs name"
}

variable "public_key" {
  description = "public key path"
}

variable "key_name" {
  description = "key name"
}

################## EC2 Commons #################

variable "ami_common" {
  description = "common ami"
}

variable "instance_type_common" {
  description = "type common"
}

################### EC2 NFS ####################
variable "nfs_name" {
  description = "nfs name"
}

################### EC2 Ansible ##################
variable "ansible_name" {
  description = "nfs name"
}

################## EC2 Cluster nodes #############
variable "cluster_name" {
  description = "cluster name"
}

############## EBS ##############

variable "ebs_delete" {}
variable "ebs_dev_name" {}
variable "ebs_vol_size" {}


######## PKEY  ##########
variable "aws_private_key_path" {}