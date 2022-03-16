terraform {
  backend "local" {
    path = "/Users/jameswilson/terraform_shared_state/{{cookiecutter.repo_name}}/terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }

  required_version = ">=0.14.9"
}

provider "azurerm" {
  features {}
  # skip_provider_registration = true
  tenant_id = "23a8fa91-0dd0-4ed0-9779-947b823c0fc7"
}

provider "azuread" {
  tenant_id = "23a8fa91-0dd0-4ed0-9779-947b823c0fc7"
}