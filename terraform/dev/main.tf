locals {
  common_tags = {
    environment = "${var.environment_tag}"
    owner       = "${var.resource_owner_tag}"
    costCenter  = "${var.cost_center_tag}"
    department  = "${var.department_tag}"
  }
}

provider "azurerm" {
  version         = "~>2.0"
  subscription_id = "6edfbbb4-cc4e-4bba-9a8f-361b1696bf0e"
  tenant_id       = "eb39acb7-fae3-4bc3-974c-b765aa1d6355"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-ressource-group"
  location = "Canada East"
  tags = {
    environment = "developement"
    owner       = "michael.belanger@gsoft.com"
    costCenter  = "SHAREGATE"
    department  = "SG"
  }
}