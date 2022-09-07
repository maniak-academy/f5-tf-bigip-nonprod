variable "pool_members" {}
variable "tenant" {}
variable "vip_address" {}
variable "common_name" {}
variable "pki_name" {}
variable "as3tmpl" {}
variable "pool_members_port" {
  default = "443"
}
variable "monitor" {
  default = "https"
}