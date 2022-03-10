terraform {

  backend "azurerm" {

    resource_group_name = "TerraformStorageTeam1-rg"

    storage_account_name = "terraformstorageteam001"

    container_name = "terraformstorage"

    key = "terraform.state"

    }

}
