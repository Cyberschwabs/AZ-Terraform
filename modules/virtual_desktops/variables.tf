variable "avd-ws" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string

        friendly_name = string
        description = string
    }))
}
variable "avd-hp" {
    type = map(object({
        location = string
        resource_group_name = string

        name = string
        friendly_name = string
        validate_environment = bool
        start_vm_on_connect = bool
        custom_rdp_properties = string
        description = string
        type = string
        maximum_sessions_allowed = number
        load_balancer_type = string
    }))
}
variable "avd-ag" {
    type = map(object({
    name = string
    location = string
    resource_group_name = string

    type = string
    host_pool_id = string
    friendly_name = string
    description = string
    }))
}
variable "remoteapp" {
    type = map(object({
        workspace_id = string
        application_group_id = string
    }))
}