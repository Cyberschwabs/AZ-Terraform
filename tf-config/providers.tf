terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.9.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tf-storage"
    storage_account_name = "tfstatestorageschwabs"
    container_name       = "terraform-state"
    key                  = "tf.tfstate"
  }
}
  provider "azurerm" {
    features {}

    subscription_id = var.subscription_id
    tenant_id       = var.client_tenant
    client_id       = var.client_id
    client_secret   = var.client_secret
  }