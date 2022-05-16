terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.13.1"
    }
  }
}

data "template_file" "init" {
  template = file("./infrastructure/bigip.tpl")
  vars = {
    HOSTNAME         = var.HOSTNAME
    DNS_ADDRESS      = var.DNS_ADDRESS
    NTP_ADDRESS      = var.NTP_ADDRESS
    GUEST_PASSWORD   = var.GUEST_PASSWORD
    EXTERNAL_ADDRESS = var.EXTERNAL_ADDRESS
    EXTERNAL_VLAN_ID = var.EXTERNAL_VLAN_ID
    INTERNAL_ADDRESS = var.INTERNAL_ADDRESS
    INTERNAL_VLAN_ID = var.INTERNAL_VLAN_ID
    DEFAULT_ROUTE    = var.DEFAULT_ROUTE
    ALLOWED_IP       = var.ALLOWED_IP
  }
}
resource "bigip_do" "do-deploy" {
  do_json = data.template_file.init.rendered
}


