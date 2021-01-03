/*
provider "azurerm" {
  use_msi = true
  features {}
}

provider "azuread" {
  version = ">= 0.6"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.41.0"
    }
  }
}

terraform {
  backend "azurerm" {
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    tenant_id            = "bcddc3a1-a21d-42be-9f62-c1b78228ef53"
    subscription_id      = "c01378bd-5b91-4df3-8da6-420d0b751d46"
  }
}
*/
