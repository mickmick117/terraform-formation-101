locals {
  common_tags = {
    environment = "developement"
    owner       = "guillaume.caya@gsoft.com"
    costCenter  = var.cost_center_tag
    department  = var.department_tag
  }
}

provider "azurerm" {
  version         = "~>2.0"
  subscription_id = "5d198d00-f97f-4598-af26-d3e2853d8229"
  features {}
}

resource "random_string" "suffix" {
  length  = 13
  upper   = false
  lower   = true
  number  = true
  special = false
  keepers = {
    region = var.location
  }
}

resource "azurerm_resource_group" "rg" {
  name     = module.resource_group_name.result
  location = var.location
  tags     = local.common_tags
}

module "resource_group_name" {
  source   = "gsoft-inc/naming/azurerm//modules/general/resource_group"
  prefixes = var.resource_group_prefixes
  suffixes = [random_string.suffix.result]
}
