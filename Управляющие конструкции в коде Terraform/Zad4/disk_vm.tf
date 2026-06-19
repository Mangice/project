# 1. Создание 3 дисков по 1 ГБ через count
resource "yandex_compute_disk" "storage_disk" {
  count = 3
  name  = "storage-disk-${count.index + 1}"
  type  = "network-hdd"
  size  = 1
  zone  = var.default_zone
}

# 2. Создание одиночной ВМ "storage" (без count и for_each)
resource "yandex_compute_instance" "storage" {
  name = "storage"
  zone = var.default_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8tm4ja1he7v7vknauu"  # Ubuntu 24.04
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  # 3. Dynamic блок для подключения созданных дисков
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk[*].id
    content {
      disk_id = secondary_disk.value
    }
  }
}
