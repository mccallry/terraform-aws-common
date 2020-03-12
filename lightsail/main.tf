resource "aws_lightsail_instance" "this" {
  name              = var.name
  availability_zone = "ca-central-1a"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "small_2_0"
  key_pair_name     = aws_lightsail_key_pair.this.name
}
resource "aws_lightsail_key_pair" "this" { 
  name = "${var.name}-Key"
}
resource "local_file" "this" { 
  content = aws_lightsail_key_pair.this.private_key
  filename = "${path.root}/${var.name}.pem"
  file_permission = "600"
}
