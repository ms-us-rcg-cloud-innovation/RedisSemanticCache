
variable "name" {
  type        = string
  description = "the name of the resources"
  default     = "redissemcache"
}

variable "resource_group_name" {
  type        = string
  description = "the resource group to deploy to"
  default     = ""
}

variable "location" {
  type        = string
  description = "the location to deploy to"
}