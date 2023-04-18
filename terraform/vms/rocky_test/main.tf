# pull provider
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = var.host_uri
}

# Define VM Volume
resource "libvirt_volume" "rocky_test-qcow2" {
  name   = "rocky_test.qcow2"
  pool   = "default"
  source = "https://download.rockylinux.org/pub/rocky/8.7/images/x86_64/Rocky-8-GenericCloud.latest.x86_64.qcow2"
  format = "qcow2"
}

# get user data
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

# get network data
data "template_file" "network_config" {
  template = "${file("${path.module}/network_config.cfg")}"
}

resource "libvirt_cloudinit_disk" "commoninit" {
  name           = "commoninit_rocky_test.iso"
  user_data      = "${data.template_file.user_data.rendered}"
  network_config = "${data.template_file.network_config.rendered}"
  pool           = "default"
}

resource "libvirt_domain" "rocky_test" {
  name   = "rocky_test"
  memory = "2048"
  vcpu   = 2

  cloudinit = libvirt_cloudinit_disk.commoninit.id

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = libvirt_volume.rocky_test-qcow2.id
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }
  graphics {
    #type = "spice"
    type = "vnc"
    listen_type = "address"
    autoport = true
  }
}
