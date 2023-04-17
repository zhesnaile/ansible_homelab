# ansible_homelab
This is a set of yml files to setup quickly a homelab with a set of services.

This setup is expected to run on a Rocky Linux machine and with podman containers.

Inspired by rishavnandi's [ansible_homelab](https://github.com/rishavnandi/ansible_homelab) and [ansible_selfhost_vpn](https://github.com/rishavnandi/ansible_selfhost_vpn) 

There is also a [terraform](terraform) folder to create local vms with libvirt (QEMU+KVM) using terraform for the purposes of testing.


## Services
Working:
- [x] [nginx-proxy-manager](https://nginxproxymanager.com/)
- [x] [wireguard-easy](https://github.com/WeeJeWel/wg-easy)
- [x] [pihole + unbound](https://github.com/chriscrowe/docker-pihole-unbound/)
- [x] dashy
Todo:

- [ ] vaultwarden
- [ ] jellyfin
- [ ] jellyseer
    - [ ] sonarr
    - [ ] radarr
    - [ ] bazarr
- [ ] qbittorrent/deluge/transmission + opvn client
- [ ] sabnzbdplus
- [ ] pyload
- [ ] grafana
- [ ] searxng
- [ ] immich
- [ ] duplicati
- [ ] gitea
- [ ] authelia/authentik
