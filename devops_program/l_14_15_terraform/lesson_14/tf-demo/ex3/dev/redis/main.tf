provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "redis" {
  source = "../../modules/redis"
  env = var.env

}

variable "env" {default = "dev"}