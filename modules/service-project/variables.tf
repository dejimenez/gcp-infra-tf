variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "services" {
  type        = set(string)
  description = "Google api to be enabled inside the project"
}

variable "host_project_number" {
  type = string
}

variable "host_project_id" {
  type = string
}

variable "subnetwork_name" {
  type = string
}

variable "shared_vpc_host_project" {
  type = any
}

// kubernetes

variable "networking_mode" {
  type = string
}

variable "vpc_self_link" {
  type = any
}

variable "subnetwork_self_link" {
  type = any
}

variable "release_channel" {
  type = string
}

variable "machine_type" {
  type = string
}