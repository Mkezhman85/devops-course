output "netology-clickhouse" {
  value = [
    "instance_name: ${yandex_compute_instance.netology-clickhouse.name}",
    "external_ip: ${yandex_compute_instance.netology-clickhouse.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.netology-clickhouse.fqdn}"

  ]
}
output "netology-vector" {
  value = [
    "instance_name: ${yandex_compute_instance.netology-vector.name}",
    "external_ip: ${yandex_compute_instance.netology-vector.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.netology-vector.fqdn}"

  ]
}
output "netology-lighthouse" {
  value = [
    "instance_name: ${yandex_compute_instance.netology-lighthouse.name}",
    "external_ip: ${yandex_compute_instance.netology-lighthouse.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.netology-lighthouse.fqdn}"

  ] 
}

