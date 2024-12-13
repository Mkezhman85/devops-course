output "jenkins-master" {
  value = [
    "instance_name: ${yandex_compute_instance.jenkins-master.name}",
    "external_ip: ${yandex_compute_instance.jenkins-master.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.jenkins-master.fqdn}"

  ]
}
output "jenkins-agent" {
  value = [
    "instance_name: ${yandex_compute_instance.jenkins-agent.name}",
    "external_ip: ${yandex_compute_instance.jenkins-agent.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.jenkins-agent.fqdn}"

  ]
}


