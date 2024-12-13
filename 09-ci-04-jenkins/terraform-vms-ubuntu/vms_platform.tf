# 1-vm. jenkins-master
variable "vm_jenkins_master_yandex_compute_instance_name" {
  type        = string
  default     = "jenkins_master"
  description = "yandex_compute_instance"
}

variable "vm_jenkins_master_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins_master_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins_master_default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_subnet_name_a_jenkins_master" {
  type        = string
  default     = "jenkins_master"
  description = "VPC network & subnet A name"
}

##############################################################################

# 2- vm. jenkins_agent
variable "vm_jenkins_agent_yandex_compute_instance_name" {
  type        = string
  default     = "jenkins_agent"
  description = "yandex_compute_instance"
}

variable "vm_jenkins_agent_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_subnet_name_b_jenkins_agent" {
  type        = string
  default     = "jenkins_agent"
  description = "VPC network & subnet B name"
}

variable "vm_jenkins_agent_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_jenkins_agent_default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
