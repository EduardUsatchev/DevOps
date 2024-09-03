provider "kubernetes" {
  config_path = "~/.kube/config"

}

module "app" {
  source = "../../modules/app"
  image = "nginx:alpine"
  env = "dev"
}