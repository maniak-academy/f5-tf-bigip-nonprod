# F5 BIG-IP AS3 VIP Module 
The following repo/code is used to manage my F5 BIGIP configuration using Infrastructure As code.

* Use HashiCorp Vault as my PKI Engine to generate certs
* Use Terraform with F5-DO to Deploy the base/network configurations
* Use Terraform with F5 AS3 with our custom module to allow me to deploy apps
* Use Terraform Cloud to manage the state of the F5 BIG-IP
* Use Github as our Source Code Repository.

![title](./images/image.png)

## How do we use it...
Well it's simple, to deploy a new secure "https" app, all we have to do it create a new file  in the folder with a .tf and add the paramters required. Using the apps-module and the as3templates folder.

For example if we want to build a vip with the following criteria
1. HTTPS (Secure)
2. 3 Pool members on port 8443
3. https health monitor
4. Cookie persistance
5. Get a new cert from the Vault PKI Engine 

We would create someting like this 

```
module "tfc-webfront-newapp" {
  source            = "./apps-module"
  tenant            = "tfc-webfront-newapp"
  common_name       = "newapp.example.com"
  as3tmpl           = "https"
  vip_address       = "10.99.99.11"
  pki_name          = "example-dot-com"
  pool_members_port = "8443"
  monitor           = "https"
  pool_members      = ["10.10.5.1", "10.10.5.2", "10.10.5.3"]
}
```

