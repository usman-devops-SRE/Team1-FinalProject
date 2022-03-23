module "cosmos_db" {
  source                = "./modules/cosmos/"
  db_location           = azurerm_resource_group.k8s_rg1.location
  db_rg_name            = azurerm_resource_group.k8s_rg1.name
  db_failover_location  = "westeurope"
  db_account_name       = "cosmosdb-team1-project3"
  #subnet3_id           = module.vnet1.subnet3_id
}