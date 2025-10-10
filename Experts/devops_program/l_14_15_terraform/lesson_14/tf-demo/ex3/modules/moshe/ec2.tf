resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = var.moshe_instance_type

}