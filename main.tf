terraform {
  cloud {
    organization = "sebbycorp"

    workspaces {
      name = "f5-tf-bigip-nonprod"
    }
  }
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.15.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "3.8.2"
    }
  }
}

# module "infrastructure" {
#   source = "./infrastructure"
# }

provider "vault" {
  address = var.vaultaddress
  token   = var.vault_token
}

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}

