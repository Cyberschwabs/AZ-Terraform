module "resource_groups" {
  source = "../modules/resourcegroups"

  resourcegroups = {
    poc-uks-avd-rg = {
      name     = "poc-${var.resourcegroup}"
      location = var.location
    }
  }
}