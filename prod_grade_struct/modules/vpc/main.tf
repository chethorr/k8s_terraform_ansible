# modules/vpc/main

resource "aws_vpc" "vpc_mod" {
  cidr_block = var.cidr_block_mod
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "${var.name} - vpc"
  }
}

# IGW integrate for now: dissolve and make a module of this

resource "aws_internet_gateway" "igw_mod" {
  vpc_id = aws_vpc.vpc_mod.id

  tags = {
    Name = "${var.name} - IGW"
  }
}

