module "resource_groups" {
  source = "../modules/resourcegroups"

  resourcegroups = {
    poc-uks-avd-rg = {
      name     = "${terraform.workspace}-${var.resourcegroup}"
      location = var.location
    }
  }
}