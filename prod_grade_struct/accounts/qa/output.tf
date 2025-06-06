output "vpc_qa_id" {
  value = module.vpc.vpc_mod_id
}

output "subnet_qa_id" {
  value = module.subnet.subnet_mod_id
}

output "subnet_qa_cidr" {
  value = module.subnet.subnet_mod_cidr
}