###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gcefjaetfoev2o8ug9"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1glb2nh4j6qd0m4cacl"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

### zone vars
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMh8uu195pUjR15ClZDRr3+pn99ydsSauEfJ5AmENhs8 sergei@sergei-N76VB"
  description = "ssh-keygen -t ed25519"
}
