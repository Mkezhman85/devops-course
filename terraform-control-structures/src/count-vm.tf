resource "yandex_compute_instance" "web" {

  depends_on = [yandex_compute_instance.db]
  count      = 2

  name = "web-${count.index + 1}"

  platform_id = var.platform_id

  zone = var.default_zone

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.type
      size     = 5
    }
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }


  metadata = {
    serial-port-enable = 1
    #ssh-keygen -t ed25519  Забудьте уже про rsa ключи!!
    # ubuntu - дефолтный пользователь в ubuntu :)
    ssh-keys = "ubuntu:${var.vms_ssh_root_key}"
  }

}