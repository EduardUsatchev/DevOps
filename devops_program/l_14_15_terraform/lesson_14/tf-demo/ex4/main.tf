resource "kubernetes_deployment" "app" {
  metadata {
    name = "app"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "app"
      }
    }

    template {
      metadata {
        labels = {
          app = "app"
        }
      }

      spec {

        container {
          image = "nginx:1.7.8"
          name  = "app"
        }
      }
    }
  }
}

resource "kubernetes_service" "app" {
  metadata {
    name = "app"
  }

  spec {
    type = "NodePort"
    selector = {
      app = "app"
    }

    port {
      port        = 80
      target_port = 80
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}