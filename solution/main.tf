locals {
  common_tags = {
    environment = var.environment_tag
    owner       = var.resource_owner_tag
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
  name     = "caya"
  location = var.location
  tags     = local.common_tags
}

module "storage_account" {
  source = "./modules/storage-resources"

  name                    = "storage0account0caya"
  resource_group_name     = azurerm_resource_group.rg.name
  resource_group_location = azurerm_resource_group.rg.location
  tags                    = local.common_tags
}

module "function_app" {
  source = "./modules/function-app"

  name                              = "fct0caya"
  resource_group_name               = azurerm_resource_group.rg.name
  resource_group_location           = azurerm_resource_group.rg.location
  storage_account_connection_string = module.storage_account.connection_string
  nodes                             = 2
  tags                              = local.common_tags
}


