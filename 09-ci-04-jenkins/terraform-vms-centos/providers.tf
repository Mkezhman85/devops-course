terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = "~>1.8.4"
}

provider "yandex" {
  cloud_id                 = var.metadata.cloud_id.default
  folder_id                = var.metadata.folder_id.default
  zone                     = var.metadata.default_zone.default
  service_account_key_file = file("~/.authorized_key.json")
}
