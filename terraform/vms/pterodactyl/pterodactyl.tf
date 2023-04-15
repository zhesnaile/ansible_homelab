# Define VM Volume
resource "libvirt_volume" "pterodactyl_ubuntu-qcow2" {
  name   = "pterodactyl_ubuntu.qcow2"
  pool   = "default"
  source = "https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64-disk-kvm.img"
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
  name           = "commoninit.iso"
  user_data      = "${data.template_file.user_data.rendered}"
  network_config = "${data.template_file.network_config.rendered}"
  pool           = "${libvirt_pool.ubuntu.name}"
}
resource "libvirt_domain" "pterodactyl_ubuntu" {
  name   = "pterodactyl_ubuntu"
  memory = "4096"
  vcpu   = 4

  network_interface {
    network_name = "default"
  }

  disk {
    volume_id = libvirt_volume.pterodactyl_ubuntu-qcow2.id
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}
