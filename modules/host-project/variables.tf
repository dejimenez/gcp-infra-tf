// global

variable "region" {
  type = string
}

// project

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}


// network

variable "vpc_name" {
  type = string
}

variable "routing_mode" {
  type = string
}

variable "mtu" {
  type = string
}

variable "subnetwork_name" {
  type = string
}

variable "ip_cidr_range" {
  type = string
}

variable "secondary_ip_ranges" {
  type = map(any)
}

// router

variable "router_name" {
  type = string
}

variable "nat_name" {
  type = string
}

variable "nat_ip_allocate_option" {
  type = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string
}
