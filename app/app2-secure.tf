
# provider "vault" {
#   address = "http://192.168.86.69:8200"
#   token   = "hvs.Wj7FJ8yYwUY8HrHGZGkrUB4x"
# }

# resource "vault_pki_secret_backend_cert" "app" {
#   backend     = "pki_int"
#   name        = "example-dot-com"
#   common_name = "test.example.com"
# }


# resource "bigip_as3" "app2" {
#   as3_json = local.as3_json
# }

# resource "local_file" "as3" {
#   content  = local.as3_json
#   count    = "1"
#   filename = "${path.module}/as3-app2-secure${count.index}.json"
# }

# locals {
#   count = "1"
#   as3_json = templatefile("./as3templates/secure.tpl", {
#     UUID        = "abcsecureapp"
#     TENANT      = "tfc-app2-secure"
#     VIP_ADDRESS = "10.10.2.1"
#     CERT        = jsonencode(vault_pki_secret_backend_cert.app.certificate)
#     KEY         = jsonencode(vault_pki_secret_backend_cert.app.private_key)
#     CA_CHAIN    = jsonencode(vault_pki_secret_backend_cert.app.ca_chain)
#   })
# }