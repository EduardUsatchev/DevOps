resource "kubernetes_service" "app" {
  depends_on = [kubernetes_namespace.ns]
  metadata {
    name = "app"
    namespace = var.env
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