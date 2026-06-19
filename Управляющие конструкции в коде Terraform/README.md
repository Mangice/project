# Домашнее задание к занятию «Основы Terraform. Yandex Cloud» - Исмаилов Осман

## Задание 1

<details>
<summary>Ответ</summary>

1. Изучите проект.
2. Инициализируйте проект, выполните код.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .

<img width="1920" height="936" alt="Снимок экрана от 2026-06-19 15-49-18" src="https://github.com/user-attachments/assets/2462fc94-b4a6-4546-a128-2cce419ebe3f" />

 - [Файлы с которыми запускал первое задание](https://github.com/Mangice/project/tree/main/%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/Zad1)


</details>

## Задание 2

<details>
<summary>Ответ</summary>
 
1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" **разных** по cpu/ram/disk_volume , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа:
```
variable "each_vm" {
  type = list(object({  vm_name=string, cpu=number, ram=number, disk_volume=number }))
}
```  
При желании внесите в переменную все возможные параметры.
3. ВМ, описанные в файле count-vm.tf, должны создаваться после ВМ, описанных в файле for_each-vm.tf.
4. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
5. Инициализируйте проект, выполните код.

<img width="1920" height="936" alt="Снимок экрана от 2026-06-19 19-02-31" src="https://github.com/user-attachments/assets/ecbf41ab-ddde-4aea-b1a6-0bcd45b6b537" />

<img width="1920" height="936" alt="Снимок экрана от 2026-06-19 19-01-25" src="https://github.com/user-attachments/assets/4d94a2e3-9bb8-412e-a9be-8baf119951b6" />

 - [Файлы с которыми запускал второе задание](https://github.com/Mangice/project/tree/main/%D0%A3%D0%BF%D1%80%D0%B0%D0%B2%D0%BB%D1%8F%D1%8E%D1%89%D0%B8%D0%B5%20%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8%20%D0%B2%20%D0%BA%D0%BE%D0%B4%D0%B5%20Terraform/Zad2)

</details>

## Задание 3

<details>
<summary>Ответ</summary>
 
1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

<img width="1920" height="936" alt="Снимок экрана от 2026-06-19 19-15-12" src="https://github.com/user-attachments/assets/194e941b-b3c9-48e5-9206-e0c9cdab0ba3" />

 - [Файлы с которыми запускал второе задание]()

</details>
