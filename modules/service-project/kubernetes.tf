resource "google_service_account" "service_account" {
  project    = local.project_id
  account_id = var.project_name

  depends_on = [
    google_project.service_project
  ]
}

resource "google_container_cluster" "gke" {
  name     = "${var.project_name}-gke"
  location = var.region
  project  = local.project_id

  networking_mode = var.networking_mode
  network         = var.vpc_self_link
  subnetwork      = var.subnetwork_self_link

  remove_default_node_pool = true
  initial_node_count       = 1

  release_channel {
    channel = var.release_channel
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "pod-ip-range"
    services_secondary_range_name = "service-ip-range"
  }

  network_policy {
    provider = "PROVIDER_UNSPECIFIED"
    enabled  = true
  }

  private_cluster_config {
    enable_private_endpoint = false
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "127.15.0.0/28"
  }

  workload_identity_config {
    workload_pool = "${google_project.service_project.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "general" {
  name       = "general"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  project    = local.project_id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    labels = {
      role = "general"
    }
    machine_type = var.machine_type

    service_account = google_service_account.service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
