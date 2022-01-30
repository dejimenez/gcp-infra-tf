resource "google_compute_network" "network" {
  name                    = var.name
  project                 = var.project
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  mtu                     = var.mtu
}

resource "google_compute_subnetwork" "private" {
  name                     = var.name
  project                  = var.project
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = google_compute_network.network.self_link
  private_ip_google_access = true

  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges

    content {
      range_name    = secondary_ip_range.key
      ip_cidr_range = secondary_ip_range.value
    }
  }
}
