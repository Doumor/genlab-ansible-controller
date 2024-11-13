terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

locals {
  zone = "ru-central1-a"
  folder_id = "b1givjpuu0bdbv3flg8g"
}

provider "yandex" {
  zone = local.zone
  folder_id = local.folder_id
}



resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

module "ansible-controller" {
  source = "./modules/ansible-controller"
  boot_disk_type = "network-hdd"
  boot_disk_size = 20
  boot_disk_image_id = "fd8k2ed4jspu35gfde1u"

  name = "genlab-ansible-controller"
  cores = 2
  memory = 2
  zone = "ru-central1-a"

  subnet_id = yandex_vpc_subnet.subnet-1.id

  path_admin_pubkey = "~/.ssh/tf_key.pub"
}

# resource "yandex_compute_disk" "genlab-ansible-controller-boot-disk" {
#   name     = "boot-disk-1"
#   type     = "network-hdd"
#   zone     = "ru-central1-a"
#   size     = "20"
#   image_id = "fd8k2ed4jspu35gfde1u"
# }

# resource "yandex_compute_instance" "genlab-ansible-controller" {
#   name = "genlab-ansible-controller"
#
#   resources {
#     cores  = 2
#     memory = 2
#   }
#
#   boot_disk {
#     disk_id = yandex_compute_disk.genlab-ansible-controller-boot-disk.id
#   }
#
#   network_interface {
#     subnet_id = yandex_vpc_subnet.subnet-1.id
#     nat       = true
#   }
#
#   metadata = {
#     ssh-keys = "ubuntu:${file("~/.ssh/tf_key.pub")}"
#   }
# }
