# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.98.0"
    }
  }
    backend "azurerm" {
      resource_group_name  = "TerraformStorageTeam1-rg"
      storage_account_name = "terraformstorage001"
      container_name       = "terraformstorage"
      key                  = "terraform.tfstate"
    
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  /*
  subscription_id = ""
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  */
} 

provider "github" {
  token = "${secrets.ACCESS_TOKEN}"
}
