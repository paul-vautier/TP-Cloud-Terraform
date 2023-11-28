variable "metadata_name" {
  type = string
}
variable "label_app" {
  type = string
}
variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
  default = -1
}

resource "kubernetes_deployment_v1" "deployment" {
  metadata {
    name = var.metadata_name
    labels = {
      app = var.label_app
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = var.label_app
      }
    }

    template {
      metadata {
        labels = {
          app = var.label_app
        }
      }

      spec {
        container {
          image = var.container_image 
          name  = var.metadata_name
          dynamic "port" {
            for_each = var.container_port != -1 ? [1] : []
            content {
              container_port = var.container_port
              name           = var.metadata_name
            }
          }
        }
      }
    }
  }
}
