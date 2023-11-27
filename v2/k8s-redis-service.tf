resource "kubernetes_service_v1" "redis" {
metadata {
  labels = {
    app = "redis"
  }
  name = "redis"
}

spec {
  type = "ClusterIP"

  port {
    name       = "redis-service"
    port       = 6379
    target_port = 6379
  }

  selector = {
    app = "redis"
  }
}
}
