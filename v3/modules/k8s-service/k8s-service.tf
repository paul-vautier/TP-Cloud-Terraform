variable "metadata_name" {
  type = string
}
variable "type" {
  type = string
}
variable "label_app" {
  type = string
}
variable "port" {
  type = number
}
variable "target_port" {
  type = number
}
variable "node_port" {
  type = number
  default = null
}
resource "kubernetes_service_v1" "service" {
  metadata {
    name = var.metadata_name
    labels = {
      app = var.label_app
    }
  }

  spec {
    type = var.type 

    port {
      name       = "${var.metadata_name}-service"
      port       = var.port
      target_port = var.target_port 
      node_port = var.node_port
    }

    selector = {
      app = var.label_app
    }
  }
}
