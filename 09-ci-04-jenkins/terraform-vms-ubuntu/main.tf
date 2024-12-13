#создаем облачную сеть jenkins_network
resource "yandex_vpc_network" "jenkins_network" {
  name = "jenkins_network"
}

#создаем облачную подсеть zone A jenkins_network - jenkins_master
resource "yandex_vpc_subnet" "jenkins_network_jenkins_master" {
  name           = var.vpc_subnet_name_a_jenkins_master
  zone           = var.vm_jenkins_master_default_zone
  network_id     = yandex_vpc_network.jenkins_network.id
  v4_cidr_blocks = var.vm_jenkins_master_default_cidr_a
}

#создаем облачную подсеть zone B jenkins_network - jenkins_agent
resource "yandex_vpc_subnet" "jenkins_network_jenkins_agent" {
  name           = var.vpc_subnet_name_b_jenkins_agent
  zone           = var.vm_jenkins_agent_default_zone
  network_id     = yandex_vpc_network.jenkins_network.id
  v4_cidr_blocks = var.vm_jenkins_agent_default_cidr_b
}


data "yandex_compute_image" "ubuntu-2004-lts" {
  family = var.metadata.yandex_compute_image.default
}

##############################################################################

# Создание первой vm - jenkins_master
resource "yandex_compute_instance" "jenkins_master" {
  name        = local.jenkins-master
  platform_id = var.vm_jenkins_master_id
  resources {
    cores         = var.vms_resources.jenkins_master.cores
    memory        = var.vms_resources.jenkins_master.memory
    core_fraction = var.vms_resources.jenkins_master.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size = 10
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.jenkins_network_jenkins_master.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

##############################################################################

# Создание второй vm - jenkins_agent
resource "yandex_compute_instance" "jenkins_agent" {
  name        = local.jenkins-agent
  platform_id = var.vm_jenkins_agent_id
  zone        = var.vm_jenkins_agent_default_zone
  resources {
    cores         = var.vms_resources.jenkins_agent.cores
    memory        = var.vms_resources.jenkins_agent.memory
    core_fraction = var.vms_resources.jenkins_agent.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      size = 10
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.jenkins_network_jenkins_agent.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}