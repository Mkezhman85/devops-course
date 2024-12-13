variable "vms_resources" {
  type = map(object({
    cores = number
    memory  = number
    core_fraction = number
  }))
  default = {
    "sonarqube" = {
      cores = 2
      memory  = 4
      core_fraction = 20
    }
    "nexus" = {
      cores = 2
      memory  = 4
      core_fraction = 20
    }
  }
}

variable "metadata" {
  type = map(object({
    type        = string
    default     = string
    description = string
  }))
  default = {
    cloud_id = {
      type        = "string"
      default     = "b1gcefjaetfoev2o8ug9"
      description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
    }
    folder_id = {
      type        = "string"
      default     = "b1glb2nh4j6qd0m4cacl"
      description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
    }
    default_zone = {   
      type        = "string"
      default     = "ru-central1-a"
      description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
    }
    yandex_compute_image = {
      type        = "string"
      default     = "centos-7"
      # default     = "ubuntu-2004-lts"
      description = "yandex_compute_image"
    }
  }
}

variable "vms_ssh_root_key" {
  
}

