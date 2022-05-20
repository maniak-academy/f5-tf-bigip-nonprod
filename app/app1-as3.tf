data "template_file" "app1" {
  template = file("./as3templates/http.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = "tfc-app1-demo"
    VIP_ADDRESS = "10.10.4.1"
  }
}
resource "bigip_as3" "app1" {
  as3_json = data.template_file.app1.rendered
}