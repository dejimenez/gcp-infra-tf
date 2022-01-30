resource "google_project" "new_project" {
  name                = var.project_name
  project_id          = var.project_id
  org_id              = var.org_id
  auto_create_network = false
}
