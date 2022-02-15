resource "google_compute_address" "static_ip" {
    name = var.public_ip_name
}