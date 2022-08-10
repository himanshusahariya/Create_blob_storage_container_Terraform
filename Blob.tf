terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "43dc09c0-4c1d-4496-9f2b-a8ee624aebff"
}

resource "azurerm_resource_group" "Blob_RG" {
  name     = "Blob_RG"
  location = "France Central"
}

resource "azurerm_storage_account" "st-acc" {
  name                     = "mystorageacc9521856732"
  resource_group_name      = azurerm_resource_group.Blob_RG.name
  location                 = azurerm_resource_group.Blob_RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "st-con" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.st-acc.name
  container_access_type = "private"
}
