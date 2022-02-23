terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_integer" "int" {
  min = 100
  max = 1000000
}

locals {
  project_id   = "${var.project_name}-${random_integer.int.result}"
}