module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.1.0"
  name = var.name
  security_group_ids = var.security_group_ids
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = var.monitoring
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}