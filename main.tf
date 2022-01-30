terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    provider "google-beta" {
      project = "my-project-id"
      region  = "us-central1"
      zone    = "us-central1-c"
    }

    random = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  region = var.region
}

resource "random_integer" "int" {
  min = 100
  max = 1000000
}

locals {
  projects_apis      = "container.googleapis.com"
  host_project_id    = "${var.host_project_name}-${random_integer.int.result}"
  service_project_id = "${var.service_project_name}-${random_integer.int.result}"
}