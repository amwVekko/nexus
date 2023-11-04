# nexus
Scripts for terraform and ansible to install nexus on proxmox

Runs on a proxmox host in a VM using docker

VM will be created with terraform by a cloudinit image
Cloud images can be found here: https://cloud-images.ubuntu.com/
I'm using: https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64-disk-kvm.img
Download image to your proxmox host.
Open the shell and use following commands to create a cloudinit template:

qm create "vmid_you_want_to_use" --memory 1024 --core 1 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
cd "location of your iso"
qm importdisk "vmid_you_want_to_use" jammy-server-cloudimg-amd64-disk-kvm.img local-lvm
qm set "vmid_you_want_to_use" --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-5000-disk-0
qm set "vmid_you_want_to_use" --ide2 local-lvm:cloudinit
qm set "vmid_you_want_to_use" --boot c --bootdisk scsi0
qm set "vmid_you_want_to_use" --serial0 socket --vga serial0

afterwards use the UI to change the cloudinit settings:
at least set IP to dhcp, i would advise

rightclick the VM and convert it into a template



---------------------------


container: https://hub.docker.com/r/sonatype/nexus3