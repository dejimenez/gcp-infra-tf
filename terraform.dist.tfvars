region          = "europe-west3"
org_id          = "id"
billing_account = "billing_id"
secondary_ip_ranges = {
  "pod-ip-range"      = "10.0.0.0/14",
  "service-ip-ranges" = "10.4.0.0/19"
}
services = ["container.googleapis.com"]