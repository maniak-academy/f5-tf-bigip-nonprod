data "template_file" "init" {
  template = file("./as3templates/secure.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = "tfc-secure-app"
    VIP_ADDRESS = "10.10.50.1"
  }
}
resource "bigip_as3" "as3-secure" {
  as3_json = data.template_file.init.rendered
}