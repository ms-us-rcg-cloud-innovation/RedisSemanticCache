variable "name" {
  type        = string
  description = "the name of the cache"
}

variable "location" {
  type        = string
  description = "the azure region to deploy"
}

variable "resource_group_name" {
  type        = string
  description = "the name of the resource group to deploy to"
}