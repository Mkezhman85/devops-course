#создаем облачную сеть develop
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем облачную подсеть zone A develop - jenkins-master
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vpc_subnet_name_a_jenkins-master
  zone           = var.vm_jenkins-master_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_jenkins-master_default_cidr_a
}

#создаем облачную подсеть zone B develop - jenkins-agent
resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vpc_subnet_name_b_jenkins-agent
  zone           = var.vm_jenkins-agent_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_jenkins-agent_default_cidr_b
}


data "yandex_compute_image" "centos-7" {
  family = var.metadata.yandex_compute_image.default
}
# data "yandex_compute_image" "ubuntu-2004-lts" {
#   family = var.metadata.yandex_compute_image.default
# }

##############################################################################

# Создание первой vm - jenkins-master
resource "yandex_compute_instance" "jenkins-master" {
  name        = local.jenkins-master
  platform_id = var.vm_jenkins-master_id
  resources {
    cores         = var.vms_resources.jenkins-master.cores
    memory        = var.vms_resources.jenkins-master.memory
    core_fraction = var.vms_resources.jenkins-master.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
      # image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
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

# Создание второй vm - jenkins-agent
resource "yandex_compute_instance" "jenkins-agent" {
  name        = local.jenkins-agent
  platform_id = var.vm_jenkins-agent_id
  zone        = var.vm_jenkins-agent_default_zone
  resources {
    cores         = var.vms_resources.jenkins-agent.cores
    memory        = var.vms_resources.jenkins-agent.memory
    core_fraction = var.vms_resources.jenkins-agent.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos-7.image_id
      # image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
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