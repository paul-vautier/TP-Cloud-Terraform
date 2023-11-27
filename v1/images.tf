#
# Vote
#
resource "docker_image" "image_vote" {
  name = "image_vote"
  build {
    context = "../example-voting-app/vote/"
  }
}



#
# Results
#
resource "docker_image" "image_result" {
  name = "image_result"
  build {
    context = "../example-voting-app/result/"
  }
}



#
# Worker
#
resource "docker_image" "image_worker" {
  name = "image_worker"
  build {
    context = "../example-voting-app/worker/"
  }
}



#
#  Redis
#
resource "docker_image" "redis" {
  name = "redis:alpine"
}



#
#  Postgres
#
resource "docker_image" "postgres" {
  name = "postgres:15-alpine"
}



#
# Seed
#
resource "docker_image" "seed" {
  name = "image_seed"
  build {
    context = "../example-voting-app/seed-data/"
  }
}