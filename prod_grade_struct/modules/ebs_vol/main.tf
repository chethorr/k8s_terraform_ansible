resource "aws_ebs_volume" "ebs_mod" {
  availability_zone = var.ebs_availability_zone
  count = 5
  size = 100

  tags = {
    Name = "${var.ebs_name}"
  }
}