output "jenkins_master" {
  value = [
    "instance_name: ${yandex_compute_instance.jenkins_master.name}",
    "external_ip: ${yandex_compute_instance.jenkins_master.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.jenkins_master.fqdn}"
  ]
}
output "jenkins_agent" {
  value = [
    "instance_name: ${yandex_compute_instance.jenkins_agent.name}",
    "external_ip: ${yandex_compute_instance.jenkins_agent.network_interface[0].nat_ip_address}",
    "fqdn: ${yandex_compute_instance.jenkins_agent.fqdn}"
  ]
}


