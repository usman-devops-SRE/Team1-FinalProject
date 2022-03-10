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
      resource_group_name  = "Test-RG-Team1"
      storage_account_name = "terraformstorage02"
      container_name       = "terraformstorage"
      key                  = "terraform"
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  /*
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  */
}
