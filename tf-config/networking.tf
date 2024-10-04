module "virtual_networks" {
  source = "../modules/networking"

  vnets = {
    poc-uks-avd-vnet = {
      name                = "poc-uks-avd-vnet"
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name
      location            = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      address_space       = ["10.0.0.0/24"]
    }
  }

  subnets = {
    poc-uks-avd-subnet = {
      resource_group_name  = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name
      virtual_network_name = module.virtual_networks.vnets["poc-uks-avd-vnet"].name
      name                 = "default"
      address_prefixes     = ["10.0.0.0/24"]
    }
  }
}