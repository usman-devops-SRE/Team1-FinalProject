module "cosmos_db" {
  source                = "./modules/cosmos/"
  db_location           = azurerm_kubernetes_cluster.k8cluster_1.location
  db_rg_name            = azurerm_kubernetes_cluster.k8cluster_1.resource_group_name
  db_failover_location  = "westeurope"
  db_account_name       = "cosmosdb-team1-project3"
  #subnet3_id           = module.vnet1.subnet3_id
}