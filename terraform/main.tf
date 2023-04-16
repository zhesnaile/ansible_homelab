terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

module "pterodactyl_ubuntu" {
  source = "./vms/pterodactyl"
}

