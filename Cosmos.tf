module "cosmos_db" {
  source            = "./modules/Cosmos/"
  location          = azurerm_resource_group.rg.location
  rg_name           = azurerm_resource_group.rg.name
  failover_location = "westeurope"
}

resource "azurerm_resource_group" "rg" {
  name     = "cosmos_db_rg"
  location = "eastus"
}