variable "location" {
  description = "The location where the resources will be provisioned."
  default     = "Canada East"
}

variable "cost_center_tag" {
  default     = "canadaeast"
  description = "The cost center tag."
}

variable "department_tag" {
  default     = "SG"
  description = "The department tag."
}

variable "resource_prefixes" {
  type = list(string)
  default = [
    "sg",
    "gravt",
    "dev",
    "formation"
  ]
}

variable "resource_group_prefixes" {
  type = list(string)
  default = [
    "gravt",
    "dev"
  ]
}
