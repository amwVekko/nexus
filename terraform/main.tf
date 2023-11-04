# Define the Proxmox virtual machine resource
resource "proxmox_vm_qemu" "example_vm" {
  name   = "example-vm"
  target_node = "your-proxmox-node" # Replace with the name of your Proxmox node
  vmid   = 101 # Replace with a unique VM ID
  os_type = "l26" # Choose the OS type that matches your VM's operating system

  # Define the storage for the virtual machine
  storage {
    type    = "scsi"
    storage = "local-lvm" # Replace with your storage pool name
    size    = "10G" # Size of the VM's virtual hard disk
  }

  # Define the network interface for the virtual machine
  network {
    model = "virtio"
  }

  # Define the template for the virtual machine (e.g., an ISO image)
  template {
    storage = "local" # Replace with your storage pool name
    file    = "iso/template.iso" # Replace with the path to your ISO image
  }

  # Define SSH keys for remote access (optional)
  sshkeys = "ssh-rsa your-ssh-public-key"
}

# Output the virtual machine ID
output "vm_id" {
  value = proxmox_vm_qemu.example_vm.vmid
}
