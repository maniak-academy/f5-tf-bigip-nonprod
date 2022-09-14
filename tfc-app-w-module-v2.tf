module "tfc-app-w-module-v2" {
  source              = "sebbycorp/app/bigip"
  version             = "1.0.5"
  tenant              = "tfc-app-w-module-v2"
  common_name         = "tfc-app-w-module-v2.maniak.academy"
  as3tmpl             = "shttps"
  vault_pki_backend   = "pki_int"
  vip_address         = "10.99.111.22"
  pki_name            = "example-dot-com"
  pool_members_port   = "443"
  monitor             = "https"
  load_balancing_mode = "least-connections-member"
  pool_members        = ["10.11.6.1", "10.11.6.2", "10.11.6.3"]
}

