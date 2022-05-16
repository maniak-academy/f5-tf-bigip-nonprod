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

module "infrastructure " {
  source = "./infrastructure"
}


