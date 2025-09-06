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
  name     = "rg-terraform-demo"
  location = var.location
}
