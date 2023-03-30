
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



# resource "vsphere_virtual_machine" "vm1" {

#   name = "Bilal-apic-db1-${local.last_2_octets1}"
#   resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#   host_system_id = data.vsphere_host.host.id
#   datastore_id = data.vsphere_datastore.datastore.id

#   memory = 6144
#   num_cpus = 4
#   guest_id = data.vsphere_virtual_machine.template_u18.guest_id
#   scsi_type = data.vsphere_virtual_machine.template_u18.scsi_type

#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }

#   disk {
#     label = "disk0"
#     size = data.vsphere_virtual_machine.template_u18.disks.0.size
#   }

#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_u18.id
#   }

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${local.template_ub18_ip}, main.yml -e 'new_ip=${local.ip1}' -e 'old_ip=${local.template_ub18_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
#   }

# }




# resource "vsphere_virtual_machine" "vm2" {

#   # depends_on = [
#   #   vsphere_virtual_machine.vm1
#   # ]
#   name = "Bilal-apic-db2-${local.last_2_octets2}"
#   resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#   host_system_id = data.vsphere_host.host.id
#   datastore_id = data.vsphere_datastore.datastore.id

#   memory = 6144
#   num_cpus = 4
#   guest_id = data.vsphere_virtual_machine.template_u18.guest_id
#   scsi_type = data.vsphere_virtual_machine.template_u18.scsi_type

#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }

#   disk {
#     label = "disk0"
#     size = data.vsphere_virtual_machine.template_u18.disks.0.size
#   }

#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_u18.id
#   }

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${local.template_ub18_ip}, main.yml -e 'new_ip=${local.ip2}' -e 'old_ip=${local.template_ub18_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
#   }

# }




# resource "vsphere_virtual_machine" "vm3" {

#   # depends_on = [
#   #   vsphere_virtual_machine.vm2
#   # ]

#   name = "Bilal-apic-db3-${local.last_2_octets3}"
#   resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#   host_system_id = data.vsphere_host.host.id
#   datastore_id = data.vsphere_datastore.datastore.id

#   memory = 6144
#   num_cpus = 4
#   guest_id = data.vsphere_virtual_machine.template_u18.guest_id
#   scsi_type = data.vsphere_virtual_machine.template_u18.scsi_type

#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }

#   disk {
#     label = "disk0"
#     size = data.vsphere_virtual_machine.template_u18.disks.0.size
#   }

#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_u18.id
#   }

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${local.template_ub18_ip}, main.yml -e 'new_ip=${local.ip3}' -e 'old_ip=${local.template_ub18_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
#   }

# }




# resource "vsphere_virtual_machine" "vm4" {

#   # depends_on = [
#   #   vsphere_virtual_machine.vm3
#   # ]

#   name = "Bilal-apic-cb1-${local.last_2_octets4}"
#   resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#   host_system_id = data.vsphere_host.host.id
#   datastore_id = data.vsphere_datastore.datastore.id

#   memory = 6144
#   num_cpus = 4
#   guest_id = data.vsphere_virtual_machine.template_u18.guest_id
#   scsi_type = data.vsphere_virtual_machine.template_u18.scsi_type

#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }

#   disk {
#     label = "disk0"
#     size = data.vsphere_virtual_machine.template_u18.disks.0.size
#   }

#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_u18.id
#   }

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${local.template_ub18_ip}, main.yml -e 'new_ip=${local.ip4}' -e 'old_ip=${local.template_ub18_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
#   }

# }




# resource "vsphere_virtual_machine" "vm5" {

#   # depends_on = [
#   #   vsphere_virtual_machine.vm4
#   # ]

#   name = "Bilal-apic-cb2-${local.last_2_octets5}"
#   resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
#   host_system_id = data.vsphere_host.host.id
#   datastore_id = data.vsphere_datastore.datastore.id

#   memory = 6144
#   num_cpus = 4
#   guest_id = data.vsphere_virtual_machine.template_u18.guest_id
#   scsi_type = data.vsphere_virtual_machine.template_u18.scsi_type

#   network_interface {
#     network_id = data.vsphere_network.network.id
#   }

#   disk {
#     label = "disk0"
#     size = data.vsphere_virtual_machine.template_u18.disks.0.size
#   }

#   clone {
#     template_uuid = data.vsphere_virtual_machine.template_u18.id
#   }

#   provisioner "local-exec" {
#     command = "ansible-playbook -i ${local.template_ub18_ip}, main.yml -e 'new_ip=${local.ip5}' -e 'old_ip=${local.template_ub18_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
#   }

# }




resource "vsphere_virtual_machine" "vm6_haproxy" {

  # do edit "depend" on to previous order vm when adding new vm
  # depends_on = [
  #   vsphere_virtual_machine.vm5
  # ]

  name = "Bilal-apic-haproxy-${local.last_2_octets6}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  host_system_id = data.vsphere_host.host.id
  datastore_id = data.vsphere_datastore.datastore.id

  memory = 6144
  num_cpus = 4
  guest_id = data.vsphere_virtual_machine.template_u20.guest_id
  scsi_type = data.vsphere_virtual_machine.template_u20.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size = data.vsphere_virtual_machine.template_u20.disks.0.size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template_u20.id
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${local.template_ub20_ip}, main.yml -e 'new_ip=${local.ip6}' -e 'old_ip=${local.template_ub20_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
  }

}




resource "vsphere_virtual_machine" "vm7_powerdns" {

  # do edit "depend" on to previous order vm when adding new vm
  # depends_on = [
  #   vsphere_virtual_machine.vm5
  # ]

  name = "Bilal-apic-powerdns-${local.last_2_octets7}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  host_system_id = data.vsphere_host.host.id
  datastore_id = data.vsphere_datastore.datastore.id

  memory = 6144
  num_cpus = 4
  guest_id = data.vsphere_virtual_machine.template_u20.guest_id
  scsi_type = data.vsphere_virtual_machine.template_u20.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size = data.vsphere_virtual_machine.template_u20.disks.0.size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template_u20.id
    # customize {
    #   linux_options {
    #     domain = "ubuntu"
    #     host_name = "ubuntu"
    #   }
    #   network_interface {
    #     ipv4_address = "172.31.29.68"
    #     ipv4_netmask = 24
    #   }
    # }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${local.template_ub20_ip}, main.yml -e 'new_ip=${local.ip7}' -e 'old_ip=${local.template_ub20_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
  }

}


resource "vsphere_virtual_machine" "vm8_powerdns" {

  # do edit "depend" on to previous order vm when adding new vm
  # depends_on = [
  #   vsphere_virtual_machine.vm5
  # ]

  name = "Bilal-apic-powerdns-${local.last_2_octets8}"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  host_system_id = data.vsphere_host.host.id
  datastore_id = data.vsphere_datastore.datastore.id

  memory = 6144
  num_cpus = 4
  guest_id = data.vsphere_virtual_machine.template_u20.guest_id
  scsi_type = data.vsphere_virtual_machine.template_u20.scsi_type

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size = data.vsphere_virtual_machine.template_u20.disks.0.size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template_u20.id
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${local.template_ub20_ip}, main.yml -e 'new_ip=${local.ip8}' -e 'old_ip=${local.template_ub20_ip}'  --ssh-extra-args '-o StrictHostKeyChecking=no'"
  }

}


