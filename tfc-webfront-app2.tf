module "tfc-backend-app1" {
  source            = "./apps-module"
  tenant            = "tfc-backend-app1"
  common_name       = "backendapp1.maniak.academy"
  as3tmpl           = "https"
  vip_address       = "10.99.99.12"
  pki_name          = "example-dot-com"
  pool_members_port = "443"
  monitor           = "https"
  pool_members      = ["10.10.3.1", "10.10.3.2"]
}