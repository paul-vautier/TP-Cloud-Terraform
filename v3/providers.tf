variable "project_id" {
  description = "project id"
  type = string
}

variable "region" {
  description = "region"
  type = string
}

variable "zone" {
  description = "zone"
  type = string
}
variable "api_key" {
  description = "location of the API Key in filesystem, granting access to GKE"
  type = string
}

variable "os_region" {
  description = ""
  type = string
}

variable "os_auth_url" {
  description = ""
  type = string
}

variable "os_tenant_name" {
  description = ""
  type = string
}

variable "os_user_name" {
  description = ""
  type = string
}

variable "os_key_name" {
  description = "the name of the private key that will be used to access OPENSTACK"
  type = string
}

terraform {
    required_providers {
	google = {
	    source = "hashicorp/google"
	    version = "5.6.0"
	}
	kubernetes = {
	    source = "hashicorp/kubernetes"
	    version = ">= 2.23.0"
	}
	openstack = {
	  source  = "terraform-provider-openstack/openstack"
	  version = "~> 1.53.0"
	}
    }
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone = var.zone
  credentials = file(var.api_key)
}

provider "openstack" {
  user_name   = var.os_user_name
  tenant_name = var.os_tenant_name
  auth_url    = var.os_auth_url
  region      = var.os_region
}

