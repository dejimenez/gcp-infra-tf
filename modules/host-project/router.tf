resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  project = local.project_id
  network = google_compute_network.main.self_link
}
