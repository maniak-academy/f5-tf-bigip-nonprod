module "tfc-webfront-app3" {
  source              = "./apps-module"
  tenant              = "tfc-webfront-app3"
  common_name         = "webfrontapp3.maniak.academy"
  as3tmpl             = "shttps"
  vip_address         = "10.99.99.13"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.10.5.1", "10.10.5.2", "10.10.5.3"]
}
