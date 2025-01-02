module "resource_groups" {
  source = "../modules/resourcegroups"

  resourcegroups = {
    webapp-rg = {
      name     = "webapp-rg"
      location = var.az_location
    }
  }
}