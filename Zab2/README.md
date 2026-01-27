# Домашнее задание к занятию «Система мониторинга Zabbix. Часть 2» - Исмаилов Осман

## Задание 1
Создайте свой шаблон, в котором будут элементы данных, мониторящие загрузку CPU и RAM хоста.

### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. В веб-интерфейсе Zabbix Servera в разделе Templates создайте новый шаблон

<img width="1920" height="946" alt="1" src="https://github.com/user-attachments/assets/3ae29e83-f854-4646-a0df-cc8a5fd489c1" />

3. Создайте Item который будет собирать информацию об загрузке CPU в процентах

<img width="1920" height="946" alt="2" src="https://github.com/user-attachments/assets/ab818577-2fd1-4dd7-bdaf-f6159267b45b" />

4. Создайте Item который будет собирать информацию об загрузке RAM в процентах

<img width="1920" height="946" alt="3" src="https://github.com/user-attachments/assets/221b1028-62df-4a84-bbb9-7460f2ca4db4" />

<img width="1920" height="946" alt="4" src="https://github.com/user-attachments/assets/59cdca5d-9b1a-401e-842d-4fd38f32f45e" />


## Задание 2
Добавьте в Zabbix два хоста и задайте им имена <фамилия и инициалы-1> и <фамилия и инициалы-2>. Например: ivanovii-1 и ivanovii-2.

### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server
3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera
5. Прикрепите за каждым хостом шаблон Linux by Zabbix Agent
6. Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов

<img width="1920" height="946" alt="5" src="https://github.com/user-attachments/assets/1ac67a07-1768-4cec-874c-f7a74e62d1c5" />


## Задание 3
Привяжите созданный шаблон к двум хостам. Также привяжите к обоим хостам шаблон Linux by Zabbix Agent.

### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Зайдите в настройки каждого хоста и в разделе Templates прикрепите к этому хосту ваш шаблон
3. Так же к каждому хосту привяжите шаблон Linux by Zabbix Agent
4. Проверьте что в раздел Latest Data начали поступать необходимые данные из вашего шаблона

<img width="1920" height="946" alt="6" src="https://github.com/user-attachments/assets/2bc3e15e-b500-4dc5-9378-cf882f00ec2f" />


## Задание 4
Создайте свой кастомный дашборд.

### Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. В разделе Dashboards создайте новый дашборд
3. Разместите на нём несколько графиков на ваше усмотрение.

<img width="1920" height="946" alt="8" src="https://github.com/user-attachments/assets/ace3bb39-6eac-4a64-8d5b-16184e0ad26e" />


