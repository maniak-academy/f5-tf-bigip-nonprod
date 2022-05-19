resource "bigip_as3" "as3-sd" {
  as3_json = file("./as3templates/sd.json")
}