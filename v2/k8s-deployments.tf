module "worker-deployment" {
  metadata_name = "worker"
  source = "./modules/k8s-deployment/"
  label_app = "worker"
  container_image = "dockersamples/examplevotingapp_worker"
}

module "vote-deployment" {
  metadata_name = "vote"
  source = "./modules/k8s-deployment/"
  label_app = "vote"
  container_image = "dockersamples/examplevotingapp_vote" 
  container_port = 80
}

module "result-deployment" {
  source = "./modules/k8s-deployment/"
  metadata_name = "result"
  label_app = "result"
  container_image = "dockersamples/examplevotingapp_result" 
  container_port = 80
}


