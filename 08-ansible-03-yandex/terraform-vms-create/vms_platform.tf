# 1-vm. clickhouse
variable "vm_clickhouse_yandex_compute_instance_name" {
  type        = string
  default     = "netology-clickhouse"
  description = "yandex_compute_instance"
}

variable "vm_clickhouse_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_clickhouse_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_clickhouse_default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_subnet_name_a_clickhouse" {
  type        = string
  default     = "develop-a"
  description = "VPC network & subnet A name"
}

##############################################################################

# 2- vm. vector
variable "vm_vector_yandex_compute_instance_name" {
  type        = string
  default     = "netology-vector"
  description = "yandex_compute_instance"
}

variable "vm_vector_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b_vector" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet B name"
}

variable "vm_vector_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_vector_default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

##############################################################################

# 3- vm. lighthouse
variable "vm_lighthouse_yandex_compute_instance_name" {
  type        = string
  default     = "netology-lighthouse"
  description = "yandex_compute_instance"
}

variable "vm_lighthouse_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_c_lighthouse" {
  type        = string
  default     = "develop-c"
  description = "VPC network & subnet C name"
}

variable "vm_lighthouse_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_lighthouse_default_cidr_c" {
  type        = list(string)
  default     = ["10.0.3.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}



