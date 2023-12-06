terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.80.0"
    }
  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}