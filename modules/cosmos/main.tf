resource "azurerm_cosmosdb_account" "db" {
  name                = "${var.db_account_name}"
  location            = "${var.db_location}"
  resource_group_name = "${var.db_rg_name}"
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_free_tier = true
  enable_automatic_failover = true
  #public_network_access_enabled = false
  #is_virtual_network_filter_enabled = true
  mongo_server_version = "4.0"

  virtual_network_rule {
      id = "${var.subnet3_id}"
      ignore_missing_vnet_service_endpoint = false
  }
/*
  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }
  
  capabilities {
    name = "MongoDBv3.4"
  }
*/
  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "Strong"
  }

  geo_location {
    location          = "${var.db_failover_location}"
    failover_priority = 1
  }

  geo_location {
    location          = "${var.db_location}"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_mongo_database" "mongo_db" {
  name                = "cosmos-mongo-db"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
}

resource "azurerm_cosmosdb_mongo_collection" "mongo_collection" {
  name                = "cosmos-mongo-db-collection"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_mongo_database.mongo_db.name

  default_ttl_seconds = "777"
  shard_key           = "uniqueKey"
  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}

output "azurerm_cosmosdb_account_id" {
  value = azurerm_cosmosdb_account.db.id
}