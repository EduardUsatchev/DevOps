resource "aws_instance" "web" {
  count = var.create_ec2 && var.instance_type == "t2.micro" ? 1 : 0
  ami = "ami-00beae93a2d981137"
  instance_type = var.instance_type
  tags = {
    Name = "eduard"
    Environment = var.env
    SpecialTag = local.my_special_condition
  }
  lifecycle {
    ignore_changes = [aws_instance.web.instance_type]
  }
  depends_on = []
}
resource "aws_security_group" "sg" {
  tags = {
    SpecialTag = local.my_special_condition
  }
}

locals {
  my_special_condition = var.env == "prod" && var.instance_type == "moshe" ? "blabla" : "lo menashe"
}