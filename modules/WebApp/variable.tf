variable "storageaccount" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "serviceplan" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    os_type             = string
    sku_name            = string
  }))
}

variable "functionapp" {
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    storage_account_name       = string
    storage_account_access_key = string
    service_plan_id            = string
  }))
}