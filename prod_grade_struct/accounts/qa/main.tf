module "vpc" {
  source = "../../modules/vpc"

  name = var.qa_name
  cidr_block_mod = var.vpc_qa_cidr
}

module "subnet" {
  source = "../../modules/subnets"

  vpc_id = module.vpc.vpc_mod_id
  igw_id = module.vpc.igw_mod_id
  pub_subnet_mod_az = var.subnet_qa_az
  pub_subnet_mod_cidr = var.subnet_qa_cidr
  name = var.qa_name
}