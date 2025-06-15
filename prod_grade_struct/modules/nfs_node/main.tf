resource "aws_instance" "nfs_ec2_mod" {
  instance_type = var.nfs_ec2_instance_type
  ami = var.nfs_ec2_ami_id
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ "${var.vpc_sg_id}"]
  associate_public_ip_address = true

  key_name = var.key_pair

   tags = {
    "name" = "${var.ec2_name} + nfs-block"
  }

  ebs_block_device {
    device_name           = var.ebs_device_name # e.g., /dev/sdh or /dev/xvdb
    volume_size           = var.ebs_volume_size_gb
    volume_type           = "gp3"
    delete_on_termination = var.ebs_delete_on_termination # Control lifecycle
    encrypted             = true
    tags = {
      Name = "${var.ec2_name}-data-volume"
    }
  }
}