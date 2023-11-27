resource "kubernetes_deployment_v1" "result-deployment" {
  metadata {
    labels = {
      app = "result"
    }
    name = "result"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "result"
      }
    }

    template {
      metadata {
        labels = {
          app = "result"
        }
      }

      spec {
        container {
          image = "dockersamples/examplevotingapp_result"
          name  = "result"

          port {
            container_port = 80
            name           = "result"
          }
        }
      }
    }
  }
}
