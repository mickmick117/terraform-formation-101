locals {
  common_tags = {
    environment = "${var.environment_tag}"
    owner       = "${var.resource_owner_tag}"
    costCenter  = "${var.cost_center_tag}"
    department  = "${var.department_tag}"
  }
}

module "resource_group_name" {
  source   = "gsoft-inc/naming/azurerm//modules/general/resource_group"
  name     = "reg"
  prefixes = "${var.resource_group_prefixes}"
  suffixes = ["${random_string.suffix.result}"]
}

provider "azurerm" {
  version         = "~>2.0"
  subscription_id = "6edfbbb4-cc4e-4bba-9a8f-361b1696bf0e"
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
  name     = "${module.resource_group_name.result}"
  location = var.location
  tags     = local.common_tags
}


