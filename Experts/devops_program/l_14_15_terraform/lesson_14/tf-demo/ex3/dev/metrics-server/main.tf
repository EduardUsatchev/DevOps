provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "metrics_server" {
  source = "cookielab/metrics-server/kubernetes"
  version = "0.11.1"
#  metrics_server_image = "nginx"
#  metrics_server_image_tag = "alpine"
}