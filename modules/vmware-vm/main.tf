data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = var.datastore_id

  num_cpus = 4
  memory   = 8192
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = var.network_id
  }

  disk {
    label = "disk0"
    size  = 100
  }

  clone {
    template_uuid = var.template_uuid
  }
}
