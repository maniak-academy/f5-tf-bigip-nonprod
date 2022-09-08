module "tfc-webfront-app3" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-app2"
  common_name       = "webfront3.maniak.academy"
  as3tmpl           = "https"
  vip_address       = "10.99.99.14"
  pki_name          = "example-dot-com"
  pool_members_port = "443"
  monitor           = "https"
  pool_members      = ["10.10.5.1", "10.10.5.2"]
}