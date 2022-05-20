
provider "vault" {
  address = "http://192.168.86.69:8200"
  token   = "hvs.Wj7FJ8yYwUY8HrHGZGkrUB4x"
}

resource "vault_pki_secret_backend_cert" "app" {
  backend     = "pki_int"
  name        = "example-dot-com"
  common_name = "test.example.com"
}


data "template_file" "app2" {
  template = file("./as3templates/secure.tpl")
  vars = {
    UUID        = "uuid()"
    TENANT      = "tfc-app2-secure"
    VIP_ADDRESS = "10.10.2.1"
   # CERT        = "${vault_pki_secret_backend_cert.app.certificate}"
   # KEY         = "${vault_pki_secret_backend_cert.app.private_key}"
   # CA_CHAIN    = "${vault_pki_secret_backend_cert.app.ca_chain}"
  }
}
resource "bigip_as3" "app2" {
  as3_json = data.template_file.app2.rendered
}