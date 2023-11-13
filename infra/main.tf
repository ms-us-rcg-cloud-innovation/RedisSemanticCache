
locals {
  resource_group_name = var.resource_group_name == "" ? var.name : var.resource_group_name
}

resource "azurerm_resource_group" "default" {
  name     = local.resource_group_name
  location = var.location
}

module "aoai" {
  source              = "./modules/aoai"
  name                = var.name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
}

module "redis" {
  source              = "./modules/redis"
  name                = var.name
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
}