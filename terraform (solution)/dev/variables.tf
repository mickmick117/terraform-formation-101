variable "location" {
  description = "The location where the resources will be provisioned."
  default     = "Canada East"
}

variable "environment_tag" {
  default     = "developement"
  description = "The resource environment tag."
}

// Change the default value for your email
variable "resource_owner_tag" {
  default     = "michael.belanger@gsoft.com"
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
