module "resource_groups" {
  source = "../modules/resourcegroups"

  resourcegroups = {
    poc-uks-avd-rg = {
      name     = "poc-uks-avd-rg"
      location = "East US"
    }
  }
}