#создаем облачную сеть develop
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем облачную подсеть zone A develop
resource "yandex_vpc_subnet" "develop-a" {
  name           = var.vpc_subnet_name_a
  zone           = var.vm_web_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr_a
}

#создаем облачную подсеть zone B develop
resource "yandex_vpc_subnet" "develop-b" {
  name           = var.vpc_subnet_name_b
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr_b
}

data "yandex_compute_image" "ubuntu-2004-lts" {
  family = var.metadata.yandex_compute_image.default
}

# Создание первой vm A
resource "yandex_compute_instance" "platform" {
  # name        = var.vm_web_yandex_compute_instance_name
  name        = local.platform
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
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

# Создание второй vm B
resource "yandex_compute_instance" "netology-develop-platform-db" {
  # name        = var.vm_db_yandex_compute_instance_name
  name        = local.netology-develop-platform-db
  platform_id = var.vm_db_platform_id
  zone        = var.vm_db_default_zone
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
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