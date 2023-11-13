data "azurerm_client_config" "current" {}

# the resource gropu that contains all triage state
resource "azurerm_resource_group" "tfstate" {
  name     = "${var.name}-tfstate"
  location = var.location
}

# this random string is used to get a unique storage account name
# NOTE: terraform state is not saved so this will generate a unique account name each execution
resource "random_string" "tfstate" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "sta${var.name}${lower(random_string.tfstate.result)}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
