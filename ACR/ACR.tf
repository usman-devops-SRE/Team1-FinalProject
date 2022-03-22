####### Resource Group for The Azure Registar conatiner & Azure Container Instance
resource "azurerm_resource_group" "ACI" {
  name     = var.resource_group_name
  location = var.location 
}
########### Azure Container Registery 
resource "azurerm_container_registry" "T1RC" {
  name                = var.Team1P3ACR
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = true
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
####### Container Registry Scope Map to pull from Repo
resource "azurerm_container_registry_scope_map" "team1map" {
  name                    = "Docker-pull"
  container_registry_name = azurerm_container_registry.T1RC.name
  resource_group_name     = azurerm_resource_group.ACI.name
  actions = [
    "repositories/repo1/content/read",
    "repositories/repo1/content/write"
  ]
}
resource "azurerm_container_registry_task" "JLT1" {
  name                  = "team1task"
  container_registry_id = azurerm_container_registry.T1RC.id
  platform {
    os = "Linux"
  }
  docker_step {
    dockerfile_path      = "Dockerfile"
    context_path         = "https://github.com/tylerkain/Team1-FinalProject/tree/finaldocker"
    context_access_token = "<github personal access token>"
    image_names          = ["bradmcken/team_1_final_project:latest", "bradmcken/team_1_final_project:apilatest", "bradmcken/team_1_final_project:dblatest"]
  }
}
