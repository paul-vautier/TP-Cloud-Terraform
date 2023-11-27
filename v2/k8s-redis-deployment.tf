resource "kubernetes_deployment_v1" "redis-deployment" {
  metadata {
    labels = {
      app = "redis"
    }
    name = "redis"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "redis"
      }
    }

    template {
      metadata {
        labels = {
          app = "redis"
        }
      }

      spec {
        container {
          image = "redis:alpine"
          name  = "redis"
          port {
            container_port = 6379
            name           = "redis"
          }

          volume_mount {
            mount_path = "/data"
            name       = "redis-data"
          }
        }

        volume {
          name = "redis-data"
          empty_dir {}
        }
      }
    }
  }
}
