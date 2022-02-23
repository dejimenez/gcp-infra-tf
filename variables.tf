variable "region" {
  type = string
}

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "secondary_ip_ranges" {
  type = map(any)
}