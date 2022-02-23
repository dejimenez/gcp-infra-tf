resource "google_compute_router_nat" "mist_nat" {
  name                               = var.nat_name
  project                            = local.project_id
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  depends_on = [
    google_compute_subnetwork.private
  ]
}
