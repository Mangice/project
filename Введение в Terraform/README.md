# Домашнее задание к занятию «Введение в Terraform» - Исмаилов Осман

## Задание 1

<details>
<summary>Ответ</summary>

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 12-19-34" src="https://github.com/user-attachments/assets/c441e283-7988-4c28-a74f-db04ffdb6e1b" />

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 12-21-04" src="https://github.com/user-attachments/assets/92ae6746-3a5f-479d-a8cc-8e698d1e5953" />


2. Изучите файл **.gitignore**. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

 - Личную конфиденциальную информацию (логины, пароли, ключи, токены) можно хранить в файле personal.auto.tfvars, поскольку он явно исключен из .gitignore и не будет передан в репозиторий.

3. Выполните код проекта. Найдите  в state-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 12-29-09" src="https://github.com/user-attachments/assets/8b71cf5d-37e7-4091-978f-d9884dda0a47" />

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 12-28-38" src="https://github.com/user-attachments/assets/5515eae4-9a5d-453d-9ba3-91965dd1081e" />

 - Значение ключа "result": "cgTf31ACv7C2aEp"

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 12-50-29" src="https://github.com/user-attachments/assets/7974228f-42bd-4165-8209-202a295995d4" />

 - Имя контейнера начинается с цифры – 1nginx -> нарушает правила именования ресурсов Terraform.
 - Обращение к несуществующему ресурсу: random_password.random_string_FAKE.resulT -> правильное имя ресурса – random_password.random_string, а атрибут – result (без заглавной буквы).
 - Отсутствует блок required_providers для random (провайдер random).

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды ```docker ps```.

<img width="1920" height="936" alt="Снимок экрана от 2026-06-13 13-05-32" src="https://github.com/user-attachments/assets/92a132c9-ff42-49c8-9067-bccde4a2f8e7" />

<img width="685" height="222" alt="Снимок экрана от 2026-06-13 13-05-42" src="https://github.com/user-attachments/assets/66fce69a-4a72-4855-862e-b9da44a6b6f0" />

<details>
<summary>Исправленный код</summary>

```
terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
    local = {
      source = "hashicorp/local"
    }
    docker = {
      source = "kreuzwerker/docker"
    }
  }
  required_version = ">= 0.13"
}

provider "docker" {}

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx_container" {
  image = docker_image.nginx.name
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
 ```
    
</details>

6. Замените имя docker-контейнера в блоке кода на ```hello_world```. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чём может быть опасность применения ключа  ```-auto-approve```. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды ```docker ps```.


7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 


8. Объясните, почему при этом не был удалён docker-образ **nginx:latest**. Ответ **ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ**, а затем **ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ** строчкой из документации [**terraform провайдера docker**](https://library.tf/providers/kreuzwerker/docker/latest).  (ищите в классификаторе resource docker_image )





    
    </details>

    
