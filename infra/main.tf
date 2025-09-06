terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

variable "subscription_id" {}
variable "tenant_id" {}
variable "location" {
  default = "eastus"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-demo1"
  location = var.location
}
variable "storage_account_name" {
  type        = string
  description = "Name of the storage account"
}

# main.tf
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name   # reference existing RG
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
