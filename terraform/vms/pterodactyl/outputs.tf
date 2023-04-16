output "ip" {
  value = "${libvirt_domain.pterodactyl_ubuntu.network_interface.0.addresses.0}"
}
