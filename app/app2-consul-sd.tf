data "template_file" "init" {
  template = file("./as3templates/consul.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = "tfc-consul-sd-demo"
    VIP_ADDRESS = "10.10.5.1"
  }
}
resource "bigip_as3" "as3-consul-sd-demo" {
  as3_json = data.template_file.init.rendered
}