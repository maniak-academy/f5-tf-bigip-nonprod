
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
    TENANT      = "tfc-workspace-demo"
    VIP_ADDRESS = "10.10.4.1"
  }
}
resource "bigip_as3" "as3-example" {
  as3_json      = data.template_file.init.rendered
  tenant_filter = var.tenant
}