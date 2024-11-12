#создаем облачную сеть develop
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем облачную подсеть zone A develop - clickhouse
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vpc_subnet_name_a_clickhouse
  zone           = var.vm_clickhouse_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_clickhouse_default_cidr_a
}

#создаем облачную подсеть zone B develop - vector
resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vpc_subnet_name_b_vector
  zone           = var.vm_vector_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_vector_default_cidr_b
}

#создаем облачную подсеть zone C develop - lighthouse
resource "yandex_vpc_subnet" "develop-c" {
  name           = var.vpc_subnet_name_c_lighthouse
  zone           = var.vm_lighthouse_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_lighthouse_default_cidr_c
}

data "yandex_compute_image" "ubuntu-2004-lts" {
  family = var.metadata.yandex_compute_image.default
}

##############################################################################

# Создание первой vm - clickhouse
resource "yandex_compute_instance" "netology-clickhouse" {
  name        = local.netology-clickhouse
  platform_id = var.vm_clickhouse_id
  resources {
    cores         = var.vms_resources.clickhouse.cores
    memory        = var.vms_resources.clickhouse.memory
    core_fraction = var.vms_resources.clickhouse.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
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

# Создание второй vm - vector
resource "yandex_compute_instance" "netology-vector" {
  name        = local.netology-vector
  platform_id = var.vm_vector_id
  zone        = var.vm_vector_default_zone
  resources {
    cores         = var.vms_resources.vector.cores
    memory        = var.vms_resources.vector.memory
    core_fraction = var.vms_resources.vector.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
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

##############################################################################

# Создание третьей vm - lighthouse
resource "yandex_compute_instance" "netology-lighthouse" {
  name        = local.netology-lighthouse
  platform_id = var.vm_lighthouse_id
  zone        = var.vm_lighthouse_default_zone
  resources {
    cores         = var.vms_resources.lighthouse.cores
    memory        = var.vms_resources.lighthouse.memory
    core_fraction = var.vms_resources.lighthouse.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
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