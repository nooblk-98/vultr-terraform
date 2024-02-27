terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.19.0"
    }
  }
}

provider "vultr" {
  api_key = var.vultr_api_key
}

resource "vultr_ssh_key" "my_ssh_key" {
  name       = "my-ssh-key"
  ssh_key    = var.ssh_public_key
}

resource "vultr_instance" "wireguard" {
  plan       = "vc2-1c-1gb"
  region     = "sgp"
  os_id      = "270" # Ubuntu 20.04 x64
  ssh_key_ids = [vultr_ssh_key.my_ssh_key.id]
}
