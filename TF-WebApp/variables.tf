# SP Azure Login
variable "subscription_id" {
  description = "Subscription ID Azure"
  type        = string
  sensitive = true
}

variable "client_secret" {
  description = "Client Secret SP"
  type = string
  sensitive = true
}

variable "client_id" {
  description = "Client Secret SP"
  type = string
  sensitive = true
}

variable "client_tenant" {
  description = "Client Secret SP"
  type = string
  sensitive = true
}

variable "az_location" {
  description = "Azure Location"
  type        = string
  default     = "eastus"
}