resource "yandex_compute_disk" "volume" {
  count = 3
  name  = "volume-${count.index + 1}"
  type  = var.disk_params.type
  zone  = var.disk_params.zone
  size  = var.disk_params.size
}

resource "yandex_compute_instance" "storage" {
  name        = var.storage_params.name
  platform_id = var.platform_id
  zone        = var.default_zone

  resources {
    cores         = var.storage_params.cores
    memory        = var.storage_params.memory
    core_fraction = var.storage_params.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.storage_params.type
      size     = var.storage_params.size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.volume.*.id
    content {
      disk_id = yandex_compute_disk.volume["${secondary_disk.key}"].id
    }
  }

}
