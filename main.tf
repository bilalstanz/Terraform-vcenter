
variable "vcenter_id" {
  type = string
}

variable "vcenter_pass" {
  type = string
}








provider "vsphere" {
  user = var.vcenter_id
  password = var.vcenter_pass
  vsphere_server = "vcenter.indiqus.local"
  allow_unverified_ssl = true
}

