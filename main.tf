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

provider "google" {
  region = var.region
}

locals {
  development_project = "development"
  staging_project     = "staging"
  production_project  = "production"
  services            = ["container.googleapis.com"]

  vpc_name        = "main"
  routing_mode    = "REGIONAL"
  mtu             = 1500
  subnetwork_name = "private"
  ip_cidr_range   = "10.5.0.0/20"

  router_name = "router"

  nat_name                           = "nat"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  networking_mode = "VPC_NATIVE"
}


module "host-project" {
  source          = "./modules/host-project"
  region          = var.region
  org_id          = var.org_id
  billing_account = var.billing_account

  vpc_name            = local.vpc_name
  routing_mode        = local.routing_mode
  mtu                 = local.mtu
  subnetwork_name     = local.subnetwork_name
  ip_cidr_range       = local.ip_cidr_range
  secondary_ip_ranges = var.secondary_ip_ranges

  router_name = local.router_name

  nat_name                           = local.nat_name
  nat_ip_allocate_option             = local.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = local.source_subnetwork_ip_ranges_to_nat
}

module "development" {
  source          = "./modules/service-project"
  project_name    = local.development_project
  region          = var.region
  org_id          = var.org_id
  billing_account = var.billing_account

  services = local.services

  host_project_number = module.host-project.host_project_number
  host_project_id     = module.host-project.host_project_id

  # network_id      = module.host-project.network_id
  subnetwork_name = local.subnetwork_name

  shared_vpc_host_project = module.host-project.shared_vpc_host_project
  networking_mode         = local.networking_mode
  vpc_self_link           = module.host-project.vpc_self_link
  subnetwork_self_link    = module.host-project.subnetwork_self_link
  release_channel         = "REGULAR"
  machine_type            = "e2-medium"
}
