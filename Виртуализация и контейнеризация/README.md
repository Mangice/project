
## Задача 1

Сценарий выполнения задачи:
- Установите docker и docker compose plugin на свою linux рабочую станцию или ВМ.
- Если dockerhub недоступен создайте файл /etc/docker/daemon.json с содержимым: ```{"registry-mirrors": ["https://mirror.gcr.io", "https://daocloud.io", "https://c.163.com/", "https://registry.docker-cn.com"]}```
- Зарегистрируйтесь и создайте публичный репозиторий  с именем "custom-nginx" на https://hub.docker.com (ТОЛЬКО ЕСЛИ У ВАС ЕСТЬ ДОСТУП);
- скачайте образ nginx:1.29.0;
- Создайте Dockerfile и реализуйте в нем замену дефолтной индекс-страницы(/usr/share/nginx/html/index.html), на файл index.html с содержимым:
  ```
  <html>
  <head>
  Hey, Netology
  </head>
  <body>
  <h1>I will be DevOps Engineer!</h1>
  </body>
  </html>
  ```
   <details>
  <summary>Скриншот</summary>
  
  Docker Hub недоступен, публикация не выполнена. Образ собран локально с именем mangice-nginx:1.0.0

  <img width="749" height="314" alt="Снимок экрана от 2026-05-11 10-05-44" src="https://github.com/user-attachments/assets/2257d765-830a-43bf-817f-7db84cb36b78" />

 </details>

 ## Задача 2

1. Запустите ваш образ custom-nginx:1.0.0 командой docker run в соответвии с требованиями:
- имя контейнера "ФИО-custom-nginx-t2"
- контейнер работает в фоне
- контейнер опубликован на порту хост системы 127.0.0.1:8080
2. Не удаляя, переименуйте контейнер в "custom-nginx-t2"
3. Выполните команду ```date +"%d-%m-%Y %T.%N %Z" ; sleep 0.150 ; docker ps ; ss -tlpn | grep 127.0.0.1:8080  ; docker logs custom-nginx-t2 -n1 ; docker exec -it custom-nginx-t2 base64 /usr/share/nginx/html/index.html```
4. Убедитесь с помощью curl или веб браузера, что индекс-страница доступна.

    <details>
    <summary>Ответ</summary>
    
      В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

    <img width="1864" height="594" alt="Снимок экрана от 2026-05-11 10-28-43" src="https://github.com/user-attachments/assets/6eb4c46e-b89c-49d9-8261-edc5d9d8b6bf" />
    
    </details>

    ## Задача 3

1. Воспользуйтесь docker help или google, чтобы узнать как подключиться к стандартному потоку ввода/вывода/ошибок контейнера "custom-nginx-t2".
   - `docker attach custom-nginx-t2`
2. Подключитесь к контейнеру и нажмите комбинацию Ctrl-C.
3. Выполните ```docker ps -a``` и объясните своими словами почему контейнер остановился.
   - В контейнере custom-nginx-t2 главный процесс — nginx (PID 1). Команда docker attach передаёт сигнал SIGINT (Ctrl+C) прямо в этот процесс. Nginx по умолчанию не обрабатывает SIGINT как перезагрузку, а завершает работу. Как только PID 1 завершается, Docker останавливает контейнер.
4. Перезапустите контейнер
   - `docker start custom-nginx-t2` -> `docker ps`
5. Зайдите в интерактивный терминал контейнера "custom-nginx-t2" с оболочкой bash.
   - `docker exec -it custom-nginx-t2 bash`
6. Установите любимый текстовый редактор(vim, nano итд) с помощью apt-get.
   - `apt-get update` -> `apt-get install -y nano`
7. Отредактируйте файл "/etc/nginx/conf.d/default.conf", заменив порт "listen 80" на "listen 81".
   - `nano /etc/nginx/conf.d/default.conf`
8. Запомните(!) и выполните команду ```nginx -s reload```, а затем внутри контейнера ```curl http://127.0.0.1:80 ; curl http://127.0.0.1:81```.
9.  Выйдите из контейнера, набрав в консоли  ```exit``` или Ctrl-D.
10. Проверьте вывод команд: ```ss -tlpn | grep 127.0.0.1:8080``` , ```docker port custom-nginx-t2```, ```curl http://127.0.0.1:8080```. Кратко объясните суть возникшей проблемы.
       - При запуске контейнера был опубликован порт 127.0.0.1:8080 -> 80 (внутренний порт контейнера).
       - Внутри контейнера было изменение listen 80 -> listen 81.
       - Nginx теперь слушает порт 81, но Docker продолжает пробрасывать трафик с хоста (8080) на порт 80 контейнера.
       - В итоге: хост стучится в 8080 -> Docker перенаправляет на порт 80 контейнера, а там ничего не слушает. Доступ к странице потерян.
11. Это дополнительное, необязательное задание. * Попробуйте самостоятельно исправить конфигурацию контейнера, используя доступные источники в интернете. Не изменяйте конфигурацию nginx и не удаляйте контейнер. Останавливать контейнер можно. [пример источника](https://www.baeldung.com/linux/assign-port-docker-container)
   - `docker stop custom-nginx-t2` -> `sudo systemctl stop docker.socket` -> `sudo systemctl stop docker` -> `sudo -i` -> `cd /var/lib/docker/containers` -> выбираем нужный контейнер -> `nano hostconfig.json` -> меняем порт на установленный -> выходим и запускаем docker
12. Удалите запущенный контейнер "custom-nginx-t2", не останавливая его.(воспользуйтесь --help или google)
   - `docker rm -f custom-nginx-t2`

<details>
<summary>Скриншоты</summary>

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

<img width="1920" height="937" alt="Снимок экрана от 2026-05-11 11-01-37" src="https://github.com/user-attachments/assets/e5ee254a-f6d7-46a4-9011-8107ce9c956d" />

<img width="1920" height="937" alt="Снимок экрана от 2026-05-11 11-01-49" src="https://github.com/user-attachments/assets/330f320d-6017-421a-b8bc-f93f40549ba9" />

<img width="1857" height="547" alt="Снимок экрана от 2026-05-11 11-02-36" src="https://github.com/user-attachments/assets/6f2f4887-ba0d-4320-91b4-413ad8f21bc3" />



</details>

## Задача 4

- Запустите первый контейнер из образа ***centos*** c любым тегом в фоновом режиме, подключив папку  текущий рабочий каталог ```$(pwd)``` на хостовой машине в ```/data``` контейнера, используя ключ -v.
  - `docker run -d --name centos_container -v $(pwd):/data centos:centos7.9.2009 tail -f /dev/null`
- Запустите второй контейнер из образа ***debian*** в фоновом режиме, подключив текущий рабочий каталог ```$(pwd)``` в ```/data``` контейнера.
  - `docker run -d --name debian_container -v $(pwd):/data debian:trixie-backports tail -f /dev/null` 
- Подключитесь к первому контейнеру с помощью ```docker exec``` и создайте текстовый файл любого содержания в ```/data```.
  - `docker exec -it centos_container bash`
- Добавьте ещё один файл в текущий каталог ```$(pwd)``` на хостовой машине.
  - `echo "Hello from host machine" > host_file.txt`
- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в ```/data``` контейнера.
  - `docker exec -it debian_container bash`

<details>
<summary>Скриншоты</summary>

В качестве ответа приложите скриншоты консоли, где видно все введенные команды и их вывод.

<img width="1835" height="313" alt="Снимок экрана от 2026-05-11 11-14-37" src="https://github.com/user-attachments/assets/b594c5c4-ecc7-4056-9d58-0bda40013e45" />

<img width="1300" height="485" alt="Снимок экрана от 2026-05-11 11-15-08" src="https://github.com/user-attachments/assets/9d0ecb07-a5cc-4415-83d4-bd8bc8f6f760" />


</details>
