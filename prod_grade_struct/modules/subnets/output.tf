output "subnet_mod_id" {
  description = "subnet module ID:"
  value = aws_subnet.pub_subnet_mod.*.id
}

output "subnet_mod_cidr" {
  description = "subnet module CIDR: "
  value = aws_subnet.pub_subnet_mod.*.cidr_block
}