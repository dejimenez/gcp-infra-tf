resource "google_compute_network" "main" {
  name                    = var.vpc_name
  project                 = google_compute_shared_vpc_host_project.host.project
  auto_create_subnetworks = false
  delete_default_routes_on_create = true
  routing_mode            = var.routing_mode
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "private" {
  name                     = var.subnetwork_name
  project                  = google_compute_shared_vpc_host_project.host.project
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.main.self_link
  private_ip_google_access = true

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.key
      ip_cidr_range = secondary_ip_range.value
    }
  }
}
