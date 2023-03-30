
variable "vcenter_id" {
  type = string
}

variable "vcenter_pass" {
  type = string
}


locals {
  template_ub18_ip = "172.31.29.61"
  # template_ub18_ip = "172.31.29.20"
  template_ub20_ip = "172.31.29.71"
  # host6_template_ub18_ip = "172.31.29.20"

  ip1 = "172.31.29.62"
  ip2 = "172.31.29.63"
  ip3 = "172.31.29.64"
  ip4 = "172.31.29.65"
  ip5 = "172.31.29.66"
  ip6 = "172.31.29.67"
  ip7 = "172.31.29.68"
  ip8 = "172.31.29.69"

  octets1 = split(".", local.ip1)
  last_2_octets1 = join(".", slice(local.octets1, 2, 4))

  octets2 = split(".", local.ip2)
  last_2_octets2 = join(".", slice(local.octets2, 2, 4))

  octets3 = split(".", local.ip3)
  last_2_octets3 = join(".", slice(local.octets3, 2, 4))

  octets4 = split(".", local.ip4)
  last_2_octets4 = join(".", slice(local.octets4, 2, 4))

  octets5 = split(".", local.ip5)
  last_2_octets5 = join(".", slice(local.octets5, 2, 4))

  octets6 = split(".", local.ip6)
  last_2_octets6 = join(".", slice(local.octets6, 2, 4))

  octets7 = split(".", local.ip7)
  last_2_octets7 = join(".", slice(local.octets7, 2, 4))

  octets8 = split(".", local.ip8)
  last_2_octets8 = join(".", slice(local.octets8, 2, 4))

}




provider "vsphere" {
  user = var.vcenter_id
  password = var.vcenter_pass
  vsphere_server = "vcenter.indiqus.local"
  allow_unverified_ssl = true
}





data "vsphere_datacenter" "datacenter" {
  name = "Indiqus"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "IQLAB1CLS1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = "172.31.6.4"
  # name          = "172.31.6.6"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = "SSD-DATA3"
  # name          = "Host-5-OS-SSD"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = "Bilal"
  # name          = "Vivek-229"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


data "vsphere_virtual_machine" "template_u18" {
  name          = "Bilal-ub18-template"
  # name          = "Ubuntu-18-100GB-Fresh"
  # name          = "Bilal-u18-.6.6-template"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template_u20" {
  name          = "Bilal-ub20-template"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}



