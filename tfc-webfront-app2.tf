module "tfc-webfront-app2" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-app2"
  common_name       = "webfront.maniak.academy"
  as3tmpl           = "https"
  vip_address       = "10.99.99.13"
  pki_name          = "example-dot-com"
  pool_members_port = "443"
  monitor           = "https"
  pool_members      = ["10.10.3.1", "10.10.3.2"]
}