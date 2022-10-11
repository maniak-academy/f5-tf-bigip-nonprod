module "tfc-webfront-app1" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-app1"
  common_name       = "webfrontapp1.example.com"
  as3tmpl           = "https"
  vip_address       = "10.99.99.11"
  pki_name          = "maniak-dot-academy"
  pool_members_port = "80"
  monitor           = "http"
  pool_members      = ["10.10.2.1", "10.10.2.2"]
}
