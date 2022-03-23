############# data
data "azurerm_client_config" "current" {}

####### Resource Group for The Azure Registar conatiner & Azure Container Instance
resource "azurerm_resource_group" "ACI" {
  name     = var.resource_group_name
  location = var.location-Acr 
}
########### Azure Container Registery 
resource "azurerm_container_registry" "T1RC" {
  name                = var.Team1P3ACR
  resource_group_name = var.resource_group_name
  location = "East Us"
  sku                 = "Premium"
  admin_enabled       = true
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
    context_access_token = "Github"
    image_names          = ["bradmcken/team_1_final_project:latest", "bradmcken/team_1_final_project:apilatest", "bradmcken/team_1_final_project:dblatest"]
  }
}
resource "azurerm_key_vault" "vault" {
  name                        = "team1KeyVaultproject3test"
  location                    = var.location
  resource_group_name         = "TerraformStorageTeam1-rg"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [ "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"  ]

    key_permissions = [
      "Get", "Backup", "Create", "Decrypt","Delete", "Encrypt", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey"
    ]

    secret_permissions = [
      "Get","Backup" , "Delete", "List", "Purge", "Recover", "Restore", "Set"
    ]

    storage_permissions = [
      "Get", "Backup", "Delete", "DeleteSAS", "GetSAS", "List", "ListSAS", "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
    ]
  }
}
