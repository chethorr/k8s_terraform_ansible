# subnet moduleS

resource "aws_subnet" "pub_subnet_mod" {
  count = length(var.pub_subnet_mod_cidr)
  vpc_id = var.vpc_id
  cidr_block = element(var.pub_subnet_mod_cidr, count.index)
  availability_zone = element(var.pub_subnet_mod_az, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.name}-public-subnet"
  }
}

# route table for public subnets

resource "aws_route_table" "pub_route_table_mod" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "${var.name}-public-route-table"
  }
}

# route table association

resource "aws_route_table_association" "public_rtass_mod" {
    count = length(aws_subnet.pub_subnet_mod.*.id)
    route_table_id = aws_route_table.pub_route_table_mod.id
    subnet_id = element(aws_subnet.pub_subnet_mod.*.id, count.index)
}
