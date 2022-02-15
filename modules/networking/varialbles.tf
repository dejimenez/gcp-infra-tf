variable "name" {
  type = string
}

variable "project" {
  type = string
}

variable "auto_create_subnetworks" {
  type = string
}

variable "routing_mode" {
  type = string
}

variable "mtu" {
  type = string
}

variable "ip_cidr_range" {
  type = string
}

variable "region" {
  type = string
}

variable "secondary_ip_ranges" {
  type = map(any)
}
