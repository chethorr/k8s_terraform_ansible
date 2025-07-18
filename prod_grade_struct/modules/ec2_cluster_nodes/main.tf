resource "aws_instance" "cluster_ec2_mod" {
  count = length(var.subnet_id)
  instance_type = var.cluster_ec2_instance_type
  ami = var.cluster_ec2_ami_id
  subnet_id = element(var.subnet_id,count.index)
  vpc_security_group_ids = [ "${var.vpc_sg_id}"]
  associate_public_ip_address = true

  key_name = var.key_pair

   tags = {
    "name" = "${var.ec2_name} + cluster"
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