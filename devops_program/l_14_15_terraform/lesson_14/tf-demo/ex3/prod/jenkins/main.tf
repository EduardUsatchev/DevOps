module jenkins {
  source  = "terraform-module/release/helm"
  version = "2.6.0"

  namespace  = "default"
  repository =  "https://charts.helm.sh/stable"

  app = {
    name          = "jenkins"
    version       = "1.5.0"
    chart         = "jenkins"
    force_update  = true
    wait          = false
    recreate_pods = false
    deploy        = 1
  }
  values = []
  set = []
  set_sensitive = [
    {
      path  = "master.adminUser"
      value = "jenkins"
    },
  ]
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
