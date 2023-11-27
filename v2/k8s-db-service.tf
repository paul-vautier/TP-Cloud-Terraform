resource "kubernetes_service_v1" "db-service" {
  metadata {
    labels = {
      app = "db"
    }
    name = "db"
  }

  spec {
    selector = {
      app = "db"
    }

    port {
      name       = "db-service"
      port       = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}
