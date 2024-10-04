module "virtual_desktops" {
  source = "../modules/virtual_desktops"

  avd-ws = {
    test-avd-ws = {
      name = "test-avd-ws"
      location = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      friendly_name = "AVD Workspace"
      description = "Workspace Test"
    }
  }

  avd-hp = {
    test-avd-hp = {
      name = "test-avd-hp"
      location            = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      name                     = "test-avd-hp"
      friendly_name            = "test-avd-hp"
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
      name = "test-avd-ag"
      location = module.resource_groups.resourcegroups["poc-uks-avd-rg"].location
      resource_group_name = module.resource_groups.resourcegroups["poc-uks-avd-rg"].name

      type          = "RemoteApp"
      host_pool_id  = module.virtual_desktops.avd-hp["test-avd-hp"].id
      friendly_name = "TestAppGroup"
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