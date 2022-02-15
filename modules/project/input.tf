variable "project_name" {
  type = string
}

variable "project_id" {
  type = string
}

variable "org_id" {
    type = string
}

variable "services" {
  type = set
  description = "Google api to be enabled inside the project"
}