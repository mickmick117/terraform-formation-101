
resource "azurerm_storage_account" "stg_acc" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
