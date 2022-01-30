resource "google_compute_router" "router" {
  name    = var.name
  region  = var.region
  project = var.project
  network = var.network
}
