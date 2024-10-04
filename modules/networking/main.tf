resource "azurerm_virtual_network" "vnets" {
  for_each = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}
resource "azurerm_subnet" "subnets" {
  for_each = var.subnets
  resource_group_name   = each.value.resource_group_name
  virtual_network_name  = each.value.virtual_network_name
  name                  = each.value.name
  address_prefixes      = each.value.address_prefixes

  depends_on = [ 
    azurerm_virtual_network.vnets 
  ]
}