resource "google_project" "service_project" {
  name                = var.project_name
  project_id          = local.project_id
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = false
}


resource "google_project_service" "service" {
  for_each = var.services
  service = each.key

  project = google_project.service_project.project_id
}