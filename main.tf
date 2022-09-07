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
    vault = {
      source  = "hashicorp/vault"
      version = "3.5.0"
    }
  }
}

#module "infrastructure" {
#  source = "./infrastructure"
#}

# module "app" {
#   source = "./app"
# }

# module "applications" {
#   source       = "./applications"
#   tenant       = "tfc-nonprod-app1"
#   common_name  = "test.example.com"
#   as3tmpl      = "https"
#   vip_address  = "10.99.99.10"
#   pki_name     = "example-dot-com"
#   pool_members = ["10.10.0.1", "10.10.0.2"]
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

