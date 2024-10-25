# SP Azure Login
variable "subscription_id" {
  description = "Subscription ID Azure"
  type = string
  default = "1024008c-c2d6-4d84-ade6-c1af7bee2bae"
}

variable "client_secret" {
  description = "Client Secret SP"
  type = string
}

variable "client_id" {
  description = "Client Secret SP"
  type = string
}

variable "client_tenant" {
  description = "Client Secret SP"
  type = string
}

# Resource Group Name / Location
variable "resourcegroup" {
  description = "RG Name"
  type        = string
  default     = "test"
}
variable "location" {
  description = "Location"
  type        = string
  default     = "eastus"
}

# VNet Name
variable "vnet" {
  description = "VNet Name"
  type = string
  default = "vnet"
}
# Subnet Name
variable "subnet" {
  description = "Subnet Name"
  type = string
  default = "sbnet"
}

# Virtual Desktops
variable "workspace" {
  description = "Workspace Name"
  type = string
  default = "workspace"
}
variable "hostpool" {
  description = "hostpool Name"
  type = string
  default = "hostpool"
}
variable "appgroup" {
  description = "App Group Name"
  type = string
  default = "appgroup"
}

