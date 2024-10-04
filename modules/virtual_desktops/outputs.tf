output "avd-ws" {
  value = azurerm_virtual_desktop_workspace.avd-ws
}
output "avd-hp" {
  value = azurerm_virtual_desktop_host_pool.avd-hp
}
output "avd-ag" {
  value = azurerm_virtual_desktop_application_group.avd-ag
}
output "remoteapp" {
  value = azurerm_virtual_desktop_workspace_application_group_association.remoteapp
}