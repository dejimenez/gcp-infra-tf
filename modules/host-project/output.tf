output "host_project_id" {
    value = google_project.host_project.project_id
}

output "network_id" {
  value = google_compute_network.main.id
}

output "network_name" {
  value = google_compute_network.main.name
}

output "host_project_number" {
  value = google_project.host_project.number
}

output "vpc_self_link" {
  value = google_compute_network.main.self_link
}

output "subnetwork_self_link" {
  value = google_compute_subnetwork.private.self_link
}

output "shared_vpc_host_project" {
  value = google_compute_shared_vpc_host_project.host.project
}