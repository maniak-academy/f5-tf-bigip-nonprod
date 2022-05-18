data "template_file" "init-as3" {
  template = file("./as3templates/http.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = "tfc-workspace-demo"
    VIP_ADDRESS = "10.10.10.1"
  }
}
resource "bigip_as3" "as3-example" {
  as3_json = data.template_file.init-as3.rendered
}