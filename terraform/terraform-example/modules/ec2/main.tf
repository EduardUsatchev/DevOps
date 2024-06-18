resource "aws_instance" "this" {
  ami = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = merge({
    Name = "example-instance"
  }, var.tags)
}
