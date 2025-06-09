output "ebs_id" {
  value = aws_ebs_volume.ebs_mod.*.id
}