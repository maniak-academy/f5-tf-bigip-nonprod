{
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.24.0",
    "id": "Consul_SD",
    "label": "${TENANT}",
    "${TENANT}": {
      "class": "Tenant",
      "Nginx": {
        "class": "Application",
        "template": "http",
        "serviceMain": {
          "class": "Service_HTTP",
          "virtualPort": 8080,
          "virtualAddresses": [
             "${VIP_ADDRESS}"
          ],
          "pool": "web_pool",
          "persistenceMethods": [],
          "profileMultiplex": {
            "bigip": "/Common/oneconnect"
          }
        },
        "web_pool": {
          "class": "Pool",
          "monitors": [
            "http"
          ],
          "members": [
            {
              "servicePort": 80,
              "addressDiscovery": "consul",
              "updateInterval": 10,
              "uri": "http://192.168.86.71:8500/v1/health/service/web?passing",
	      "jmesPathQuery": "[*].{id:Node.Address,ip:{private:Node.Address,public:Node.Address},port:Service.Port}"
            }
          ]
        }
      }
    }
  }
}