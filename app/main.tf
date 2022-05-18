
terraform {
  required_providers {
    bigip = {
      source  = "F5Networks/bigip"
      version = "1.13.1"
    }
  }
}

data "template_file" "init" {
  template = file("./as3templates/as3.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = var.tenant
    VIP_ADDRESS = var.vip_address
  }
}
resource "bigip_as3" "as3-example" {
  as3_json      = data.template_file.init.rendered
  tenant_filter = var.tenant
}