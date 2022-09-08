## THe following is a Terraform configuration file for the TFC Web Frontend Application
## This file is used to deploy the TFC Web Frontend Application to the BIG-IP
#

module "tfc-webfront-app1" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-app1"
  common_name       = "webfrontapp1.example.com"
  as3tmpl           = "https"
  vip_address       = "10.99.99.11"
  pki_name          = "example-dot-com"
  pool_members_port = "80"
  monitor           = "http"
  pool_members      = ["10.10.2.1", "10.10.2.2"]
}