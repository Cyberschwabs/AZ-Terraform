output "serviceplan" {
  value = { for k, v in azurerm_service_plan.serviceplan : k => v.name }
}

output "storageaccount" {
  value = { for k, v in azurerm_storage_account.storageaccount : k => v.name }
}

output "functionapp" {
  value = { for k, v in azurerm_windows_function_app.functionapp : k => v.name }
}