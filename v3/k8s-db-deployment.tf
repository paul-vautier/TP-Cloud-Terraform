resource "kubernetes_deployment_v1" "db-deployment" {
  metadata {
    name = "db"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "db"
      }
    }

    template {
      metadata {
        labels = {
          app = "db"
        }
      }

      spec {
        container {
          image = "postgres:15-alpine"
          name  = "postgres"

          env {
            name  = "POSTGRES_USER"
            value = "postgres"
          }

          env {
            name  = "POSTGRES_PASSWORD"
            value = "postgres"
          }

          port {
            container_port = 5432
            name           = "postgres"
          }

          volume_mount {
            mount_path = "/var/lib/postgresql/data"
            name       = "db-data"
          }
        }
        volume {
          name = "db-data"
          empty_dir { }
        }
      }
    }
  }
}

