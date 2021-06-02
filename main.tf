terraform {
  required_providers {
    extip = {
      source = "petems/extip"
    }
  }
}

data "extip" "external_ip" {}

output "external_ip" {
  value = data.extip.external_ip.ipaddress
}
