resource "google_compute_shared_vpc_host_project" "host" {
  project = google_project.host_project.number
}
