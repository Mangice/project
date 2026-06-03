# Домашнее задание к занятию «Практическое применение Docker» - Исмаилов Осман

<details>
<summary> Задания </summary>

## Задача 0
1. Убедитесь что у вас НЕ(!) установлен ```docker-compose```, для этого получите следующую ошибку от команды ```docker-compose --version```

    ```
    Command 'docker-compose' not found, but can be installed with:

    sudo snap install docker          # version 24.0.5, or
    sudo apt  install docker-compose  # version 1.25.0-1

    See 'snap info docker' for additional versions.
    ```

    В случае наличия установленного в системе ```docker-compose``` - удалите его.

2. Убедитесь что у вас УСТАНОВЛЕН ```docker compose```(без тире) версии не менее v2.24.X, для это выполните команду ```docker compose version```

   <img width="1920" height="937" alt="Снимок экрана от 2026-06-01 14-38-18" src="https://github.com/user-attachments/assets/59055a32-85bf-4712-9ad0-ed580ff9cb09" />


## Задача 1
1. Сделайте в своем GitHub пространстве fork [репозитория](https://github.com/netology-code/shvirtd-example-python).

2. Создайте файл ```Dockerfile.python``` на основе существующего `Dockerfile`:
   - Используйте базовый образ ```python:3.12-slim```
   - Обязательно используйте конструкцию ```COPY . .``` в Dockerfile
   - Создайте `.dockerignore` файл для исключения ненужных файлов
   - Используйте ```CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]``` для запуска
   - Протестируйте корректность сборки

   <img width="1764" height="88" alt="Снимок экрана от 2026-06-03 20-02-06" src="https://github.com/user-attachments/assets/c7fc800f-1cd4-43c2-bbcc-c29ad80570f2" />


2.1 Используйте multistage сборку вместо single stage.



<img width="1848" height="44" alt="Снимок экрана от 2026-06-02 14-37-47" src="https://github.com/user-attachments/assets/d91b31b0-a057-41a7-8522-82f103b5e2cf" />


## Задача 2
1. Изучите файл "proxy.yaml"
2. Создайте в репозитории с проектом файл ```compose.yaml```. С помощью директивы "include" подключите к нему файл "proxy.yaml".
3. Опишите в файле ```compose.yaml``` следующие сервисы: 

   - ```web```. Образ приложения должен ИЛИ собираться при запуске compose из файла ```Dockerfile.python```. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.5```. Сервис должен всегда перезапускаться в случае ошибок.
Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса ```web``` 

   - ```db```. image=mysql:8. Контейнер должен работать в bridge-сети с названием ```backend``` и иметь фиксированный ipv4-адрес ```172.20.0.10```. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

4. Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда ```curl -L http://127.0.0.1:8090``` должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: ```docker ps -a ``` и ```docker logs <container_name>``` . Если вместо IP-адреса вы получаете информационную ошибку --убедитесь, что вы шлете запрос на порт ```8090```, а не 5000.
        
 <img width="1858" height="267" alt="Снимок экрана от 2026-06-02 14-30-14" src="https://github.com/user-attachments/assets/069cb861-9592-4966-8a2c-eb77626db9a2" />


5. Подключитесь к БД mysql с помощью команды ```docker exec -ti <имя_контейнера> mysql -uroot -p<пароль root-пользователя>```(обратите внимание что между ключем -u и логином root нет пробела. это важно!!! тоже самое с паролем) . Введите последовательно команды (не забываем в конце символ ; ): ```show databases; use <имя вашей базы данных(по-умолчанию virtd, как это указано в .env)>; show tables; SELECT * from requests LIMIT 10;```. Примечание: таблица в БД создается после первого поступившего запроса к приложению.

6. Остановите проект. В качестве ответа приложите скриншот sql-запроса.

 <img width="1848" height="822" alt="Снимок экрана от 2026-06-02 14-36-36" src="https://github.com/user-attachments/assets/c197ff50-e9c2-43e5-8ecd-83ea32579804" />

 <img width="1848" height="438" alt="Снимок экрана от 2026-06-02 14-36-54" src="https://github.com/user-attachments/assets/6fdcf6fd-1c53-4a53-817d-2bde79f0b4cd" />



## Задача 3
1. Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).
2. Подключитесь к Вм по ssh и установите docker.
3. Напишите [bash-скрипт](./files/deploy.sh), который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.
   
    


4. Зайдите на сайт проверки http подключений, например(или аналогичный): ```https://check-host.net/check-http``` и запустите проверку вашего сервиса ```http://<внешний_IP-адрес_вашей_ВМ>:8090```. Таким образом трафик будет направлен в ingress-proxy. Трафик должен пройти через цепочки: Пользователь → Internet → Nginx → HAProxy → FastAPI(запись в БД) → HAProxy → Nginx → Internet → Пользователь

    <img width="1920" height="937" alt="Снимок экрана от 2026-06-03 19-15-45" src="https://github.com/user-attachments/assets/9e74c27a-e1bf-4762-ba20-3d9a82c1012f" />


5. (Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения ```docker ps -a```

6. Повторите SQL-запрос на сервере и приложите скриншот и ссылку на [fork](https://github.com/Mangice/shvirtd-example-python).

   <img width="1920" height="937" alt="Снимок экрана от 2026-06-03 19-20-41" src="https://github.com/user-attachments/assets/be531df7-c9c8-4ac9-8e33-44481f2c44a1" />


## Задача 4
Скачайте docker образ ```hashicorp/terraform:latest``` и скопируйте бинарный файл ```/bin/terraform``` на свою локальную машину, используя dive и docker save.
Предоставьте скриншоты  действий.

<img width="1920" height="937" alt="Снимок экрана от 2026-06-03 19-26-11" src="https://github.com/user-attachments/assets/cc01e914-7f22-41c1-aba1-adcd03df2eb1" />




## Задача 4.1
Добейтесь аналогичного результата, используя docker cp.  
Предоставьте скриншоты  действий.

<img width="1764" height="118" alt="Снимок экрана от 2026-06-03 20-21-33" src="https://github.com/user-attachments/assets/80855116-f9cf-4e0e-af3e-76227e69e1a0" />



</details>


