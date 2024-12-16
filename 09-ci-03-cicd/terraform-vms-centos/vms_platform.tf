# 1-vm. sonarqube
variable "vm_sonarqube_yandex_compute_instance_name" {
  type        = string
  default     = "netology-sonarqube"
  description = "yandex_compute_instance"
}

variable "vm_sonarqube_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_sonarqube_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_sonarqube_default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_subnet_name_a_sonarqube" {
  type        = string
  default     = "develop-a"
  description = "VPC network & subnet A name"
}

##############################################################################

# 2- vm. nexus
variable "vm_nexus_yandex_compute_instance_name" {
  type        = string
  default     = "netology-nexus"
  description = "yandex_compute_instance"
}

variable "vm_nexus_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b_nexus" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet B name"
}

variable "vm_nexus_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_nexus_default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
