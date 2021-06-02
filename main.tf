terraform {
  required_providers {
    extip = {
      source = "petems/extip"
    }
  }
}

resource "null_resource" "mynull" {
  count = 3

  provisioner "local-exec" {
    command = "echo ${count.index}"
  }

}

data "extip" "external_ip" {
}

output "external_ip" {
  value = data.extip.external_ip.ipaddress
}
