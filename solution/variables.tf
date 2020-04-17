variable "location" {
  description = "The location where the resources will be provisioned."
  default     = "Canada East"
}

variable "environment_tag" {
  default     = "developement"
  description = "The resource environment tag."
}

variable "resource_owner_tag" {
  default     = "guillaume.caya@gsoft.com"
  description = "The resource owner tag."
}

variable "cost_center_tag" {
  default     = "canadaeast"
  description = "The cost center tag."
}

variable "department_tag" {
  default     = "SG"
  description = "The department tag."
}
