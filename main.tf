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
      version = "1.16.2"
    }
  }
}

module "infrastructure" {
  source = "./infrastructure"
}

# provider "vault" {
#   address = "http://192.168.86.169:8200"
#   token   = var.vault_token
# }

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}


