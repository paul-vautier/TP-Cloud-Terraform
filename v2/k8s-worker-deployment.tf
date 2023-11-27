resource "kubernetes_deployment_v1" "worker" {
  metadata {
    name = "worker"
    labels = {
      app = "worker"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "worker"
      }
    }

    template {
      metadata {
        labels = {
          app = "worker"
        }
      }

      spec {
        container {
          image = "dockersamples/examplevotingapp_worker"
          name  = "worker"
        }
      }
    }
  }
}
