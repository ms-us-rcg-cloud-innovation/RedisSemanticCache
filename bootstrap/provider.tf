terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.80.0"
    }
  }

  required_version = ">= 1.5"
}

provider "azurerm" {
  # Configuration options
  features {

  }
}