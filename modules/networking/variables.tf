variable "vnets" {
    type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    }))
}
variable "subnets" {
    type = map(object({
    resource_group_name     = string
    virtual_network_name    = string
    name                    = string
    address_prefixes        = list(string)
    }))
}