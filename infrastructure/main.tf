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
    HOSTNAME         = "bigip-nonprod.maniak.academy"
    DNS_ADDRESS      = "8.8.8.8"
    NTP_ADDRESS      = "1.1.2.1"
    GUEST_PASSWORD   = "W3lcome098!"
    EXTERNAL_ADDRESS = "10.20.1.100/24"
    EXTERNAL_VLAN_ID = "1"
    INTERNAL_ADDRESS = "10.10.1.100/24"
    INTERNAL_VLAN_ID = "2"
    DEFAULT_ROUTE    = "10.20.1.1"
    ALLOWED_IP       = "192.168.0.0/16"
  }
}
resource "bigip_do" "do-deploy" {
  do_json = data.template_file.init.rendered
}


