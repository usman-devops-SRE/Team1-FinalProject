resource "azurerm_resource_group" "ACR" {
  name     = var.ACR
  location = var.location
}

resource "azurerm_container_registry" "ACReast" {
  name                = azurerm_container_registry.ACReast.name
  resource_group_name = azurerm_resource_group.ACR.name
  location            = azurerm_resource_group.ACR.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "eastus"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "westeurope"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}