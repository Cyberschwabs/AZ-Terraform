module "WebApp" {
  source = "../modules/WebApp"

  storageaccount = {
    webapp-storageaccount = {
      name                     = "${terraform.workspace}storageaccountschwabs"
      resource_group_name      = module.resource_groups.resourcegroups["webapp-rg"].name
      location                 = module.resource_groups.resourcegroups["webapp-rg"].location
      account_tier             = "Standard"
      account_replication_type = "LRS"
    }
  }

  serviceplan = {
    webapp-serviceplan = {
      name                = "${terraform.workspace}-webapp-serviceplan"
      resource_group_name = module.resource_groups.resourcegroups["webapp-rg"].name
      location            = module.resource_groups.resourcegroups["webapp-rg"].location
      os_type             = "Windows"
      sku_name            = "F1"
    }
  }

  functionapp = {
    webapp-functionapp = {
      name                       = "${terraform.workspace}-webapp-functionapp"
      resource_group_name        = module.resource_groups.resourcegroups["webapp-rg"].name
      location                   = module.resource_groups.resourcegroups["webapp-rg"].location
      storage_account_name       = module.WebApp.storageaccount["webapp-storageaccount"].name
      storage_account_access_key = module.WebApp.storageaccount["webapp-storageaccount"].primary_access_key
      service_plan_id            = module.WebApp.serviceplan["webapp-serviceplan"].id
    }
  }
}