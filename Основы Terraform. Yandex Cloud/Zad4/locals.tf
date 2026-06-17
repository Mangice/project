locals {
  # Имена ВМ с интерполяцией
  web_vm_name = "${var.vpc_name}-web"
  db_vm_name  = "${var.vpc_name}-db"
}
