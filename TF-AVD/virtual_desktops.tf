module "virtual_desktops" {
  source = "../modules/virtual_desktops"

  avd-ws = {
    test-avd-ws = {
      name = "pov-${var.workspace}"
      location = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      friendly_name = "AVD Workspace"
      description = "Workspace Test"
    }
  }

  avd-hp = {
    test-avd-hp = {
      name = "poc-${var.hostpool}"
      location            = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      name                     = "poc-${var.hostpool}"
      friendly_name            = "poc-${var.hostpool}"
      validate_environment     = false
      start_vm_on_connect      = true
      custom_rdp_properties    = "audiocapturemode:i:1;audiomode:i:0;"
      description              = "Host Pool"
      type                     = "Pooled"
      maximum_sessions_allowed = 2
      load_balancer_type       = "BreadthFirst"
    }
  }

  avd-ag = {
    test-avd-ag = {
      name = "poc-${var.appgroup}"
      location = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      type          = "RemoteApp"
      host_pool_id  = module.virtual_desktops.avd-hp["test-avd-hp"].id
      friendly_name = var.appgroup
      description   = "TestAppGroup"
    }
  }

  remoteapp = {
    remoteapp = {
      workspace_id = module.virtual_desktops.avd-ws["test-avd-ws"].id
      application_group_id = module.virtual_desktops.avd-ag["test-avd-ag"].id
    }
  }
}
