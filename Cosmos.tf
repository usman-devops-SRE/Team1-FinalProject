module "cosmos_db" {
  source               = "./modules/Cosmos/"
  db_location             = azurerm_resource_group.db_rg.location
  db_rg_name              = azurerm_resource_group.db_rg.name
  db_failover_location = "westeurope"
  subnet3_id           = module.vnet1.subnet3_id
}

resource "azurerm_resource_group" "db_rg" {
  name     = "cosmos_db_rg"
  location = "eastus"
}