variable "region" {
  type = string
}

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "host_project_name" {
  type = string
}

variable "service_project_name" {
  type = string
}

variable "secondary_ip_ranges" {
  type = map(any)
}