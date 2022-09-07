module "tfc-webfront-app2" {
  source       = "./applications"
  tenant       = "tfc-webfront-app2"
  common_name  = "webfrontapp2.example.com"
  as3tmpl      = "https"
  vip_address  = "10.99.99.13"
  pki_name     = "example-dot-com"
  pool_members_port = "80"
  monitor = "http"
  pool_members = ["10.10.2.1", "10.10.2.2"]
}