# deploy application using as3
resource "bigip_as3" "nginx" {
  as3_json = file("./as3templates/nginx.json")
}