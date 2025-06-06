output "vpc_mod_id" {
    description = "The ID of the ${var.name} VPC"
    value = aws_vpc.vpc_mod.id
}

output "vpc_mod_cidr_block" {
  description = "The CIDR Block of ${var.name} VPC"
  value = aws_vpc.vpc_mod.cidr_block
}

output "igw_mod_id" {
  description = "IGW ${var.name} IGW ID"
  value = aws_internet_gateway.igw_mod.id
}