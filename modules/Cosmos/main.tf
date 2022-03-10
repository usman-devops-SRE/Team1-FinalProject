/*
data "azurerm_subnet" "subnet3" {
    name                       = "${var.subnet_name3}"
    virtual_network_name       = "${var.vnet_name}"
    resource_group_name        = "${var.rg_name}"
}
*/
resource "azurerm_cosmosdb_account" "db" {
  name                = "cosmos-db-team1-project3-1234"
  location            = "${var.db_location}"
  resource_group_name = "${var.db_rg_name}"
  offer_type          = "Standard"
  kind                = "MongoDB"

  enable_automatic_failover = true
  enable_multiple_write_locations = true
  public_network_access_enabled = false
  is_virtual_network_filter_enabled = true

  virtual_network_rule {
      id = "${var.subnet3_id}"
      #data.azurerm_subnet.subnet3.id
      ignore_missing_vnet_service_endpoint = true
  }

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
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

resource "azurerm_cosmosdb_mongo_database" "example" {
  name                = "cosmos-mongo-db"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
}

resource "azurerm_cosmosdb_mongo_collection" "example" {
  name                = "cosmos-mongo-db-collection"
  resource_group_name = azurerm_cosmosdb_account.db.resource_group_name
  account_name        = azurerm_cosmosdb_account.db.name
  database_name       = azurerm_cosmosdb_mongo_database.example.name

  default_ttl_seconds = "777"
  shard_key           = "uniqueKey"
  throughput          = 400

  index {
    keys   = ["_id"]
    unique = true
  }
}