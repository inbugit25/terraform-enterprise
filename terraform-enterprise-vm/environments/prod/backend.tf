terraform {

  backend "azurerm" {

    resource_group_name  = "terraform-rg"

    storage_account_name = "terraformstate001"

    container_name       = "tfstate"

    key                  = "prod.tfstate"
  }
}
