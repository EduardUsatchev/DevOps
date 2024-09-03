provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQ3EGUEWMQFCB2PXD"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami = "ami-00beae93a2d981137"
  instance_type = var.instance_type
  subnet_id = "subnet-0c3ec9b67f3a8426c"
  tags = {
    Name = "eduard"
  }
}

variable "instance_type" {
  default = "t2.micro"
}


output "ip_address" {
  value = aws_instance.web.public_ip
}