output "netology-sonarqube" {
  value = [
    "instance_name: ${yandex_compute_instance.netology-sonarqube.name}",
    "external_ip: ${yandex_compute_instance.netology-sonarqube.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.netology-sonarqube.fqdn}"

  ]
}
output "netology-nexus" {
  value = [
    "instance_name: ${yandex_compute_instance.netology-nexus.name}",
    "external_ip: ${yandex_compute_instance.netology-nexus.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.netology-nexus.fqdn}"

  ]
}


