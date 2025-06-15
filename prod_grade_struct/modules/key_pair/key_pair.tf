resource "aws_key_pair" "key_pair_mod" {
  key_name = var.key_name
  public_key = file(var.public_key_path)
}