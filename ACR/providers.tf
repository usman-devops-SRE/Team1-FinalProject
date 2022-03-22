terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.99.0"
    }
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}

provider "azurerm" {
}

