<details>
<summary>Задание 1</summary>

1. Создание пользователя sys_temp
 
 ```sql
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'password';
```

2. Получение списка пользователей

```sql
SELECT user, host FROM mysql.user;
```
3. Выдача всех прав

```sql
GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

4. Получение списка прав 

```sql
SHOW GRANTS FOR 'sys_temp'@'localhost';
```

5.Переподключитесь к базе данных от имени sys_temp.

```sql
ALTER USER 'sys_temp'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;
```

6. Создание базы данных sakila

```sql
CREATE DATABASE sakila;
USE sakila;
```

7. Восстановление дампа

```sql
SOURCE /sakila-data.sql;
```

8. Получение списка таблиц 

```sql
SHOW TABLES;
SHOW FULL TABLES;
```

</details>

<details>
<summary>Задание 2</summary>

  ```sql
  USE sakila;

  SELECT 
      TABLE_NAME AS 
      COLUMN_NAME AS 
  FROM 
      INFORMATION_SCHEMA.COLUMNS
  WHERE 
      TABLE_SCHEMA = 'sakila' 
      AND COLUMN_KEY = 'PRIMARY'
  ORDER BY 
      TABLE_NAME;
```
