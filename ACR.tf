data "azurerm_client_config" "current" {}

####### Resource Group for The Azure Registar conatiner & Azure Container Instance
resource "azurerm_resource_group" "ACI" {
  name     = var.resource_group_name
  location = var.acr-location 
}
########### Azure Container Registery 
resource "azurerm_container_registry" "T1RC" {
  name                = var.Team1P3ACR
  resource_group_name = var.resource_group_name
  location            = var.acr-location
  sku                 = "Premium"
  identity {
    type = "SystemAssigned"
  }
  georeplications {
    location                = "Central US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
