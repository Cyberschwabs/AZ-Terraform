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
    subscription_id = "1024008c-c2d6-4d84-ade6-c1af7bee2bae"
  }