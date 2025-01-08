#создаем облачную сеть develop
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем облачную подсеть zone A develop - sonarqube
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vpc_subnet_name_a_sonarqube
  zone           = var.vm_sonarqube_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_sonarqube_default_cidr_a
}

#создаем облачную подсеть zone B develop - nexus
resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vpc_subnet_name_b_nexus
  zone           = var.vm_nexus_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_nexus_default_cidr_b
}


data "yandex_compute_image" "centos-7" {
  family = var.metadata.yandex_compute_image.default
}
# data "yandex_compute_image" "ubuntu-2004-lts" {
#   family = var.metadata.yandex_compute_image.default
# }

##############################################################################

# Создание первой vm - sonarqube
resource "yandex_compute_instance" "netology-sonarqube" {
  name        = local.netology-sonarqube
  platform_id = var.vm_sonarqube_id
  resources {
    cores         = var.vms_resources.sonarqube.cores
    memory        = var.vms_resources.sonarqube.memory
    core_fraction = var.vms_resources.sonarqube.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

##############################################################################

# Создание второй vm - nexus
resource "yandex_compute_instance" "netology-nexus" {
  name        = local.netology-nexus
  platform_id = var.vm_nexus_id
  zone        = var.vm_nexus_default_zone
  resources {
    cores         = var.vms_resources.nexus.cores
    memory        = var.vms_resources.nexus.memory
    core_fraction = var.vms_resources.nexus.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}