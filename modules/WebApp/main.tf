resource "azurerm_storage_account" "storageaccount" {
  for_each                 = var.storageaccount
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

resource "azurerm_service_plan" "serviceplan" {
  for_each            = var.serviceplan
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  os_type             = each.value.os_type
  sku_name            = each.value.sku_name
}

resource "azurerm_windows_function_app" "functionapp" {
  for_each                   = var.functionapp
  name                       = each.value.name
  resource_group_name        = each.value.resource_group_name
  location                   = each.value.location

  storage_account_name       = each.value.storage_account_name
  storage_account_access_key = each.value.storage_account_access_key
  service_plan_id            = each.value.service_plan_id

  site_config {}
}