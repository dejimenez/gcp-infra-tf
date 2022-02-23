resource "google_project" "host_project" {
  name                = local.project_name
  project_id          = local.project_id
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = false
}
