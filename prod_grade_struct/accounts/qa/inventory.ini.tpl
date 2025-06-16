[master]
${master_node_ip} ansible_port=22 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/k8s_terraform_ansible/ansible/key

[worker]
${worker_node1_ip} ansible_port=22 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/k8s_terraform_ansible/ansible/key
${worker_node2_ip} ansible_port=22 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/k8s_terraform_ansible/ansible/key