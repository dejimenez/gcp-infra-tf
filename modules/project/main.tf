resource "google_project" "new_project" {
  name                = var.project_name
  project_id          = var.project_id
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = false
}

resource "google_project_service" "service" {
  for_each = var.services
  service = each.key

  project = google_project.new_project.project_id
}