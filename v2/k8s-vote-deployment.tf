resource "kubernetes_deployment_v1" "vote-deployment" {
  metadata {
    name = "vote"
    labels = {
      app = "vote"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "vote"
      }
    }

    template {
      metadata {
        labels = {
          app = "vote"
        }
      }

      spec {
        container {
          image = "dockersamples/examplevotingapp_vote"
          name  = "vote"

          port {
            container_port = 80
            name           = "vote"
          }
        }
      }
    }
  }
}
