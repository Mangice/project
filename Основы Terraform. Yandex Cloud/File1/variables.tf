### Cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Yandex Cloud availability zone"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

### SSH vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

### Service account key

variable "service_account_key_file" {
  description = "Path to service account key file"
  type        = string
  sensitive   = true
}

variable "vms_ssh_public_root_key" {
  description = "Public SSH key for VM access"
  type        = string
  sensitive   = true
}

### VM web variables

variable "vm_web_name" {
  type        = string
  description = "Name of the web VM"
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "Platform ID for the VM"
  default     = "standard-v3"
}

variable "vm_web_cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 2
}

variable "vm_web_memory" {
  type        = number
  description = "Memory in GB"
  default     = 1
}

variable "vm_web_core_fraction" {
  type        = number
  description = "Core fraction for the VM"
  default     = 20
}

variable "vm_web_image_family" {
  type        = string
  description = "Image family for the VM"
  default     = "ubuntu-2004-lts"
}

variable "vm_web_disk_type" {
  type        = string
  description = "Disk type for the VM"
  default     = "network-hdd"
}
