variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  description = "Existing CloudShare resource group"
  type        = string
  default     = "AZ-104-M1"
}
