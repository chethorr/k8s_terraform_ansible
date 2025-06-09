resource "aws_instance" "nfs_ec2_mod" {
  instance_type = var.nfs_ec2_instance_type
  ami = var.nfs_ec2_ami_id
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ ]
  associate_public_ip_address = true


  key_name = var.key_pair

   tags = {
    "name" = "${var.ec2_name} + nfs-block"
  }
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  instance_id = aws_instance.nfs_ec2_mod.id
  volume_id = var.ebs_volume_id
  device_name = "/dev/sde"
}