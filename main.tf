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
      version = "1.13.1"
    }
  }
}

module "infrastructure" {
  source = "./infrastructure"
}

module "app" {
  source = "./app"
}

module "app5" {
  source       = "./app4"
  tenant       = "app5"
  vip_address  = "10.99.99.11"
  common_name  = "test.example.com"
  pki_name     = "example-dot-com"
  pool_members = ["10.10.0.3", "10.10.0.3"]
}

module "app4" {
  source       = "./app4"
  tenant       = "app4"
  vip_address  = "10.99.99.10"
  common_name  = "test.example.com"
  pki_name     = "example-dot-com"
  pool_members = ["10.10.0.1", "10.10.0.2"]
}

provider "vault" {
  address = var.vaultaddress
  token   = var.vault_token
}


provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}

