terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

module "pterodactyl_ubuntu" {
  source = "./vms/pterodactyl"
  host_uri = "qemu+ssh://toucan@birdcage/system?keyfile=/home/bali/.ssh/id_ed25519_bc_client"
}
