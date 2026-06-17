output "vm_info" {
  description = "Information about all VMs"
  value = {
    web = {
      instance_name = local.web_vm_name
      external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.platform.fqdn
    }
    db = {
      instance_name = local.db_vm_name
      external_ip   = yandex_compute_instance.db.network_interface.0.nat_ip_address
      fqdn          = yandex_compute_instance.db.fqdn
    }
  }
}

output "web_external_ip" {
  description = "External IP of web VM"
  value       = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}

output "db_external_ip" {
  description = "External IP of db VM"
  value       = yandex_compute_instance.db.network_interface.0.nat_ip_address
}
