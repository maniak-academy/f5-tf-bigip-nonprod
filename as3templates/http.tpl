{
   "class": "AS3",
   "action": "deploy",
   "persist": true,
   "declaration": {
      "class": "ADC",
      "schemaVersion": "3.0.0",
      "id": "urn:uuid:${UUID}",
      "label": "${TENANT}",
      "remark": "Simple HTTP application with RR pool",
      "${TENANT}": {
         "class": "Tenant",
         "A1": {
            "class": "Application",
            "template": "http",
            "serviceMain": {
               "class": "Service_HTTP",
               "virtualAddresses": [
                  "${VIP_ADDRESS}"
               ],
               "pool": "web_pool"
            },
            "web_pool": {
               "class": "Pool",
               "monitors": [
                  "http"
               ],
               "members": [{
                  "servicePort": 80,
                  "serverAddresses": [
                     "192.0.1.1",
                     "192.0.1.2"
                  ]
               }]
            }
         }
      }
   }
}