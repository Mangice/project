# Домашнее задание к занятию  «Очереди RabbitMQ» - Исмаилов Осман

## Задание 1. Установка RabbitMQ

Используя Vagrant или VirtualBox, создайте виртуальную машину и установите RabbitMQ.
Добавьте management plug-in и зайдите в веб-интерфейс.

<details>
<summary>Скриншоты</summary>

*Итогом выполнения домашнего задания будет приложенный скриншот веб-интерфейса RabbitMQ.*

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 14-22-35" src="https://github.com/user-attachments/assets/7dfb1ffe-8b5e-4871-aef2-095b5fd580a9" />

<img width="1859" height="706" alt="Снимок экрана от 2026-03-22 14-30-51" src="https://github.com/user-attachments/assets/91e4e366-7502-4c4f-ae36-7733aaa8faff" />

</details>

## Задание 2. Отправка и получение сообщений

Используя приложенные скрипты, проведите тестовую отправку и получение сообщения.
Для отправки сообщений необходимо запустить скрипт producer.py.

Для работы скриптов вам необходимо установить Python версии 3 и библиотеку Pika.
Также в скриптах нужно указать IP-адрес машины, на которой запущен RabbitMQ, заменив localhost на нужный IP.

Зайдите в веб-интерфейс, найдите очередь под названием hello и сделайте скриншот.
После чего запустите второй скрипт consumer.py и сделайте скриншот результата выполнения скрипта

<details>
<summary>Скриншоты</summary>

*В качестве решения домашнего задания приложите оба скриншота, сделанных на этапе выполнения.*

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 14-50-27" src="https://github.com/user-attachments/assets/87613fd2-cc06-4604-a540-01c0fe6f75e5" />(Очередь Hello)

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 14-51-06" src="https://github.com/user-attachments/assets/7c91d4a7-7487-421a-a238-6d8d70fed76a" />(Запуск consumer.py)

</details>

## Задание 3. Подготовка HA кластера

Используя Vagrant или VirtualBox, создайте вторую виртуальную машину и установите RabbitMQ.
Добавьте в файл hosts название и IP-адрес каждой машины, чтобы машины могли видеть друг друга по имени.

Затем объедините две машины в кластер и создайте политику ha-all на все очереди.

<details>
<summary>Скриншоты</summary>

*В качестве решения домашнего задания приложите скриншоты из веб-интерфейса с информацией о доступных нодах в кластере и включённой политикой.*

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-16-26" src="https://github.com/user-attachments/assets/3255bc26-cd09-4c81-8d84-8bb968cb2742" />

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-16-33" src="https://github.com/user-attachments/assets/25dab217-5e10-4617-ad6b-6883bd7f461a" />(rabbitmqctl cluster_status на 1 машине)

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-17-13" src="https://github.com/user-attachments/assets/9a8691d3-a1e6-4498-8eda-b640795b3e4a" />

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-17-20" src="https://github.com/user-attachments/assets/55a5ef99-0526-4c52-94da-d5a360ed07b4" />(rabbitmqctl cluster_status на 2 машине)

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-18-23" src="https://github.com/user-attachments/assets/f9e74575-d976-47f8-93bc-75bc3aa83b7b" />(В браузере)

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-28-15" src="https://github.com/user-attachments/assets/a989eba2-3770-4e60-8ee4-495c71fd97a6" />(Политики)

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-39-08" src="https://github.com/user-attachments/assets/4f24d696-01b9-4083-a8b2-7bc93aaa387c" />

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-33-10" src="https://github.com/user-attachments/assets/4cfd5e33-a5f5-4836-85f4-d5d5acabf1b9" />

<img width="1920" height="937" alt="Снимок экрана от 2026-03-22 16-33-22" src="https://github.com/user-attachments/assets/81947248-397d-4625-9592-8542473e7f85" />

