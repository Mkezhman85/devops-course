###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "type" {
  type        = string
  default     = "network-hdd"
  description = "boot_disk.initialize_params.type"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_compute_image"
}

variable "vms_ssh_root_key" {

}

variable "each_vm" {
  type = list(object({
    vm_name       = string,
    cpu           = number,
    ram           = number,
    disk_volume   = number,
    type          = string,
    platform_id   = string,
    default_zone  = string,
    core_fraction = number
  }))
  default = [
    {
      vm_name = "main", cpu = 2, ram = 2, disk_volume = 6, type = "network-hdd", platform_id = "standard-v1", default_zone = "ru-central1-a", core_fraction = 5
    },
    {
      vm_name = "replica", cpu = 4, ram = 4, disk_volume = 7, type = "network-hdd", platform_id = "standard-v1", default_zone = "ru-central1-a", core_fraction = 5
    },
  ]
}

variable "yandex_disk_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "yandex_disk_image"
}

variable "disk_params" {
  type = object({
    type = string,
    zone = string,
    size = number
  })
  default = {
    type = "network-hdd",
    zone = "ru-central1-a",
    size = 1
  }
}

variable "storage_params" {
  type = object({
    name          = string,
    cores         = number
    memory        = number
    core_fraction = number
    type          = string
    size          = number
  })
  default = {
    name          = "storage",
    type          = "network-hdd"
    cores         = 2,
    memory        = 1,
    core_fraction = 5,
    size          = 5
  }
}