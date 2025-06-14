locals {
  inbound_ports  = var.sg_ports_inbound
  #["80", "443", "22"]
  outbound_ports = var.sg_ports_outbound
  #["80", "443", "22"]
}

# creating security groups

resource "aws_security_group" "k8_mod" {
  vpc_id = var.sg_vpc_id

  name = var.sg_name

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  # tags = {
  #   Name = "${var.name}-public-route-table"
  # }

}