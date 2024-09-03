resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = merge({
    Name = var.vpc_name
  }, var.tags)
}
