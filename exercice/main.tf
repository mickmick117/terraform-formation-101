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

resource "azurerm_resource_group" "rg" {
  location = var.location
  tags     = local.common_tags
}
