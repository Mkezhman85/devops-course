# 1-vm. jenkins-master
variable "vm_jenkins-master_yandex_compute_instance_name" {
  type        = string
  default     = "netology-jenkins-master"
  description = "yandex_compute_instance"
}

variable "vm_jenkins-master_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins-master_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins-master_default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_subnet_name_a_jenkins-master" {
  type        = string
  default     = "develop-a"
  description = "VPC network & subnet A name"
}

##############################################################################

# 2- vm. jenkins-agent
variable "vm_jenkins-agent_yandex_compute_instance_name" {
  type        = string
  default     = "netology-jenkins-agent"
  description = "yandex_compute_instance"
}

variable "vm_jenkins-agent_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b_jenkins-agent" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet B name"
}

variable "vm_jenkins-agent_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins-agent_default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
