# Создание inventory-файла для Ansible с помощью templatefile
resource "local_file" "inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    webservers = {
      for vm in yandex_compute_instance.web :
      vm.name => {
        ansible_host = vm.network_interface.0.nat_ip_address
        fqdn         = vm.fqdn
      }
    }
    databases = {
      for name, vm in yandex_compute_instance.db :
      name => {
        ansible_host = vm.network_interface.0.nat_ip_address
        fqdn         = vm.fqdn
      }
    }
    storage_vm = {
      storage = {
        ansible_host = yandex_compute_instance.storage.network_interface.0.nat_ip_address
        fqdn         = yandex_compute_instance.storage.fqdn
      }
    }
  })
  filename = "inventory.ini"
}
