resource "azurerm_app_service_plan" "svc_plan" {
  name                = "azure-functions-test-service-plan"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "fct_app" {
  name                      = var.name
  location                  = var.resource_group_location
  resource_group_name       = var.resource_group_location
  app_service_plan_id       = azurerm_app_service_plan.svc_plan.id
  storage_connection_string = var.storage_account_connection_string
}
