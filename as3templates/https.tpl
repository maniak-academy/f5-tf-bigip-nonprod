{
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.0.0",
    "id": "123abc",
    "label": "Sample 2",
    "remark": "HTTPS with predictive-node pool",
    "${TENANT}": {
      "class": "Tenant",
      "A1": {
        "class": "Application",
        "service": {
          "class": "Service_HTTPS",
          "virtualAddresses": [
             "${VIP_ADDRESS}"
          ],
          "pool": "${POOL_NAME}",
          "serverTLS": "${SSL_PROFILE}"
        },
        "${POOL_NAME}": {
          "class": "Pool",
          "loadBalancingMode": "predictive-node",
          "monitors": [
            "http"
          ],
          "members": [{
            "servicePort": 80,
            "shareNodes": true,
            "serverAddresses": ${MY_POOLMEMBERS}
          }]
        },
        "${SSL_PROFILE}": {
          "class": "TLS_Server",
          "certificates": [{
            "certificate": "${TLS_CERT}"
          }]
        },
        "${TLS_CERT}": {
          "class": "Certificate",
          "remark": "in practice we recommend using a passphrase",
          "certificate": ${CERT},
          "privateKey": ${KEY},
          "chainCA": ${CA_CHAIN}
        }
      }
    }
  }
}