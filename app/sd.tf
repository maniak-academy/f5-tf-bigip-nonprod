resource "bigip_as3" "as3-sd" {
  as3_json = file("sd.json")
}