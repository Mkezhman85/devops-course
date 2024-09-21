resource "yandex_compute_instance" "db" {


  for_each = { for each in var.each_vm : each.vm_name => each }

  name = each.value.vm_name

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = each.value.type
      size     = each.value.disk_volume
    }
  }

  platform_id = each.value.platform_id

  zone = each.value.default_zone

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = local.ssh-keys
  }

}