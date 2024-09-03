module "my-new-service" {
  source = "../../modules/aws/ec2-instance"
  name = var.name
  instance_type = var.instance_type
  key_name = var.key_name
  environment = var.environment
  monitoring = var .monitoring
  terraform =var.terraform
  security_group_ids = var.security_group_ids
}