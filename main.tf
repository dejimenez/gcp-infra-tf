terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    google-beta = {
      source = "hashicorp/google-beta"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "google" {
  region  = var.region
  credentials = file("./credentials.json")
}

provider "google-beta" {
  project = var.default_project
  region  = var.region
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

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}
