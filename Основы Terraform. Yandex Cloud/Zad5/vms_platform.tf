### VM web variables (закомментированы)

# variable "vm_web_name" {
#   type        = string
#   description = "Name of the web VM"
#   default     = "netology-develop-platform-web"
# }

# variable "vm_web_platform_id" {
#   type        = string
#   description = "Platform ID for the VM"
#   default     = "standard-v3"
# }

# variable "vm_web_cores" {
#   type        = number
#   description = "Number of CPU cores"
#   default     = 2
# }

# variable "vm_web_memory" {
#   type        = number
#   description = "Memory in GB"
#   default     = 1
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   description = "Core fraction for the VM"
#   default     = 20
# }

# variable "vm_web_image_family" {
#   type        = string
#   description = "Image family for the VM"
#   default     = "ubuntu-2004-lts"
# }

# variable "vm_web_disk_type" {
#   type        = string
#   description = "Disk type for the VM"
#   default     = "network-hdd"
# }

### VM db variables (закомментированы)

# variable "vm_db_name" {
#   type        = string
#   description = "Name of the db VM"
#   default     = "netology-develop-platform-db"
# }

# variable "vm_db_platform_id" {
#   type        = string
#   description = "Platform ID for the db VM"
#   default     = "standard-v3"
# }

# variable "vm_db_cores" {
#   type        = number
#   description = "Number of CPU cores for db VM"
#   default     = 2
# }

# variable "vm_db_memory" {
#   type        = number
#   description = "Memory in GB for db VM"
#   default     = 2
# }

# variable "vm_db_core_fraction" {
#   type        = number
#   description = "Core fraction for the db VM"
#   default     = 20
# }

# variable "vm_db_image_family" {
#   type        = string
#   description = "Image family for the db VM"
#   default     = "ubuntu-2004-lts"
# }

# variable "vm_db_disk_type" {
#   type        = string
#   description = "Disk type for the db VM"
#   default     = "network-hdd"
# }

### Оставлена только vm_db_zone

variable "vm_db_zone" {
  type        = string
  description = "Availability zone for the db VM"
  default     = "ru-central1-b"
}
