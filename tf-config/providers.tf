terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
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
  }