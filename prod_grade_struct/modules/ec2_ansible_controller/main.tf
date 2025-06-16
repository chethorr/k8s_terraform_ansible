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


  provisioner "remote-exec" {
    inline = [
      "sudo yum install ansible -y",
      "sudo yum install git -y",
      "git clone https://github.com/chethorr/k8s_terraform_ansible.git"
    ]

  }

  provisioner "file" {
    source      = "key"
    destination = "/home/ec2-user/k8s_terraform_ansible/ansible/key"
  }

  provisioner "file" {
    source      = "../../accounts/qa/ansible.cfg"
    destination = "/home/ec2-user/k8s_terraform_ansible/ansible/ansible.cfg"
  }

  provisioner "file" {
    source = "../../accounts/qa/inventory.ini"
    destination = "/home/ec2-user/k8s_terraform_ansible/ansible/inventory.ini"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ec2-user/k8s_terraform_ansible/ansible/key",
      "ansible-playbook -i /home/ec2-user/k8s_terraform_ansible/ansible/inventory.ini /home/ec2-user/k8s_terraform_ansible/ansible/k8_play.yaml"
      
    ]
  }


  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.aws_private_key_path)
  }

  depends_on = [  ]






}