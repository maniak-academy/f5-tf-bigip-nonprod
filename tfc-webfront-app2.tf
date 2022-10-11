module "tfc-backend-app2" {
  source              = "./apps-module"
  tenant              = "tfc-backend-app2"
  common_name         = "backendapp2.maniak.academy"
  as3tmpl             = "https"
  vip_address         = "10.99.99.12"
  pki_name            = "maniak-dot-academy"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.10.3.1", "10.10.3.2", "10.10.3.3"]
}
