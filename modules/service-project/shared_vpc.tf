resource "google_compute_shared_vpc_service_project" "service" {
  host_project    = var.host_project_id
  service_project = local.project_id
}

resource "google_compute_subnetwork_iam_binding" "binding" {
  project    = var.shared_vpc_host_project
  region     = var.region
  subnetwork = var.subnetwork_name

  role = "roles/compute.networkUser"
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
    "serviceAccount:${google_project.service_project.number}@cloudservices.gserviceaccount.com",
    "serviceAccount:service-${google_project.service_project.number}@container-engine-robot.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "container-engine" {
  project = var.shared_vpc_host_project
  role    = "roles/container.hostServiceAgentUser"

  members = [
    "serviceAccount:service-${google_project.service_project.number}@container-engine-robot.iam.gserviceaccount.com",
  ]
  depends_on = [
    google_project_service.service
  ]
}
