terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

variable "host_uri" {
    type = string
    default = "qemu:///system"
}

provider "libvirt" {
  uri = var.host_uri
}

