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
  name     = "caya"
  prefixes = var.resource_group_prefixes
  suffixes = [random_string.suffix.result]
}

module "storage_account" {
  source = "./modules/storage-account"

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
}


