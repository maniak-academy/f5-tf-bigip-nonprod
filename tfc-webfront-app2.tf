# module "tfc-webfront-app2" {
#   source = "./vip-module"
#   tenant            = "tfc-webfront-app2"
#   common_name       = "webfrontapp2.example.com"
#   as3tmpl           = "https"
#   vip_address       = "10.99.99.13"
#   pki_name          = "example-dot-com"
#   pool_members_port = "443"
#   monitor           = "https"
#   pool_members      = ["10.10.30.1", "10.10.30.2"]
# }