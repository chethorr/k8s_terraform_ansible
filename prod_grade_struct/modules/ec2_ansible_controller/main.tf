resource "aws_instance" "ansible_ec2_mod" {
  instance_type = var.ansible_ec2_instance_type
  ami = var.ansible_ec2_ami_id
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ "${var.vpc_sg_id}"]
  associate_public_ip_address = true

  key_name = var.key_pair

   tags = {
    "name" = "${var.ec2_name} + ansible"
  }
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  instance_id = aws_instance.nfs_ec2_mod.id
  volume_id = var.ebs_volume_id
  device_name = "/dev/sde"
}