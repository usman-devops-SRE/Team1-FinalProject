terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
  backend "azurerm" {
      resource_group_name  = "TerraformStorageTeam1-rg"
      storage_account_name = "terraformstorage001"
      container_name       = "terraformstorage"
      key                  = "terraform.tfstate"
    
    }
}

provider "azurerm" {
  features {}
  
}

