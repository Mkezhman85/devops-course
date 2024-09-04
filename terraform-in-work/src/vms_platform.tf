# 1-vm
variable "vm_web_yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "yandex_compute_instance"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_subnet_name_a" {
  type        = string
  default     = "develop-a"
  description = "VPC network & subnet A name"
}

##############################################################################

# 2- vm
variable "vm_db_yandex_compute_instance_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "yandex_compute_instance"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet B name"
}

variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}



