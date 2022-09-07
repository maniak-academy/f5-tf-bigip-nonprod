module "tfc-webfront-app1" {
  source       = "./applications"
  tenant       = "tfc-webfront-app1"
  common_name  = "app2.example.com"
  as3tmpl      = "https"
  vip_address  = "10.99.99.11"
  pki_name     = "example-dot-com"
  pool_members = ["10.10.2.1", "10.10.2.2"]
}