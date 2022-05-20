output "cert" {
  value = vault_pki_secret_backend_cert.app.certificate
}
output "key" {
  value = vault_pki_secret_backend_cert.app.private_key
}
output "chain" {
  value = vault_pki_secret_backend_cert.app.ca_chain
}