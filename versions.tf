terraform {
  required_version = ">= 0.14.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = ">= 2.9.14"
    }
  }
}
