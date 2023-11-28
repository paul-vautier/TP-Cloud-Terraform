module "vote-service" {
  metadata_name = "vote"
  type = "NodePort"
  label_app = "vote"
  source = "./modules/k8s-service/"
  port = 5000
  target_port = 80
  node_port = 31000
}

module "result-service" {
  metadata_name = "result"
  type = "NodePort"
  label_app = "result"
  source = "./modules/k8s-service/"
  port = 5001
  target_port = 80
  node_port = 31001
}
module "redis-service" {
  metadata_name = "redis"
  type = "ClusterIP"
  label_app = "redis"
  source = "./modules/k8s-service/"
  port = 6379
  target_port = 6379 
}
module "db-service" {
  metadata_name = "db"
  type = "ClusterIP"
  label_app = "db"
  source = "./modules/k8s-service/"
  port = 5432
  target_port = 5432
}
