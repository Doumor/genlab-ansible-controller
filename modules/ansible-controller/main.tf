terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~>0.129.0"
    }
  }
  required_version = ">=1.9.2"
}

# Create a virtual machine to host the application
resource "yandex_compute_instance" "ansible-controller" {
  name = var.name

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      type     = var.boot_disk_type
      size     = var.boot_disk_size
      image_id = var.boot_disk_image_id
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.path_admin_pubkey)}"
  }
}
