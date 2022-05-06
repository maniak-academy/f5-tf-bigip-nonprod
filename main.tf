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

provider "bigip" {
  address  = var.bigipmgmt
  username = var.bigipmgmtuser
  password = var.bigippass
}



data "template_file" "init" {
  template = file("bigip.tpl")
  vars = {
    HOSTNAME       = "bigip-nonprod.maniak.academy"
    DNS_ADDRESS    = "1.1.1.1"
    NTP_ADDRESS    = "8.8.8.8"
    GUEST_PASSWORD = "W3lcome098!"
  }
}
resource "bigip_do" "do-deploy" {
  do_json = data.template_file.init.rendered
}


