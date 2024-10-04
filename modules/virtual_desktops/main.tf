resource "azurerm_virtual_desktop_workspace" "avd-ws" {
  for_each            = var.avd-ws
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  friendly_name = each.value.friendly_name
  description   = each.value.description
}

resource "azurerm_virtual_desktop_host_pool" "avd-hp" {
  for_each            = var.avd-hp
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  name                     = each.value.name
  friendly_name            = each.value.friendly_name
  validate_environment     = each.value.validate_environment
  start_vm_on_connect      = each.value.start_vm_on_connect
  custom_rdp_properties    = each.value.custom_rdp_properties
  description              = each.value.description
  type                     = each.value.type
  maximum_sessions_allowed = each.value.maximum_sessions_allowed
  load_balancer_type       = each.value.load_balancer_type
}

resource "azurerm_virtual_desktop_application_group" "avd-ag" {
  for_each            = var.avd-ag
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  type          = each.value.type
  host_pool_id  = each.value.host_pool_id
  friendly_name = each.value.friendly_name
  description   = each.value.description
}

resource "azurerm_virtual_desktop_workspace_application_group_association" "remoteapp" {
  for_each             = var.remoteapp
  workspace_id         = each.value.workspace_id
  application_group_id = each.value.application_group_id
}