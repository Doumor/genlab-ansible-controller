variable "zone" {
  description = "The availability zone where the PostgreSQL host will be created"
  type = string
}

variable "boot_disk_image_id" {
  description = "Yandex Cloud OS image ID"
  type = string
}

variable "boot_disk_size" {
  description = "Size of the OS boot disk"
  type = number
}

variable "boot_disk_type" {
  description = "Type of the OS boot disk"
  type = string
}

variable "name" {
  description = "Name of VM"
  type = string
}

# variable "platform_id" {
#   description = "Yandex Cloud platform ID"
#   type = string
# }

variable "cores" {
  description = "CPU cores"
  type = number
}

variable "memory" {
  description = "RAM in gigabytes"
  type = number
}

variable "subnet_id" {
  description = "The ID of the subnet, to which the host belongs. The subnet must be a part of the network to which the cluster belongs"
  type = string
}

# variable "internal_ipv4_address" {
#   description = "Internal IP address within the subnet"
#   type = string
# }

# variable "external_ipv4_address" {
#   description = "Internet-facing address, should be already reserved in web UI"
#   type = string
# }

# variable "security_group_ids" {
#   description = "Security group ids for network interface"
#   type = list(string)
# }

variable "path_admin_pubkey" {
  description = "Path to the public part of an OpenSSH key (local to controller)"
  type = string
}
