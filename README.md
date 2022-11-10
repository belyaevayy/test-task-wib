# Тестовое задание "Покупки и выручка"
Для удобства лучше использовать сервис https://sqliteonline.com и субд `PostgreSQL`.

1. Инициализация таблиц.
Для инициализации таблиц необходимо скопировать код из файла init-db и вставить его в редактор, далее нажать `Run`.
В меню слева в `PostgreSQL` должно отобразиться три таблицы `Items`, `Users`, `Purchases`.

2. Для проверки решений использовать `SQL` запросы ниже. Также запросы лежат в папке (sql)[./sql]. 

## Задание А
### Пункт 1
```
    SELECT FLOOR(AVG(price)) as avg_price26_35
    from Items
    JOIN Purchases on Items.itemId = Purchases.itemId
    JOIN Users on Purchases.userid = Users.userid
    WHERE age BETWEEN 26 and 35;
```
### Пункт 2
```
    SELECT FLOOR(AVG(price)) as avg_price18_25
    from Items
    JOIN Purchases on Items.itemId = Purchases.itemId
    JOIN Users on Purchases.userid = Users.userid
    WHERE age BETWEEN 18 and 25;
```
## Задание Б
```
    SELECT  EXTRACT(month from date) as month,sum(price) as sum
    FROM purchases
    JOIN users on purchases.userid=users.userid
    JOIN items ON purchases.itemid=items.itemid
    WHERE extract(YEAR from date) = 2020 and age > 35
    GROUP by month
    ORDER BY sum DESC
    limit 1;
```
## Задание В
```
    SELECT title, sum(price) as revenue
    FROM purchases
    JOIN users on purchases.userid=users.userid
    JOIN items ON purchases.itemid=items.itemid
    where extract( year from date) = 2021
    GROUP BY title
    order by revenue desc
    limit 1;
```
## Задание Г
```
    select title, revenue, round(1.0 * revenue / year_revenue * 100) as percent_revenue
    from (SELECT title, sum(price) as revenue, (SELECT sum(price) 
            FROM purchases
            JOIN items ON purchases.itemid=items.itemid
            where extract( year from date) = 2021) as year_revenue
            FROM purchases
            JOIN users on purchases.userid=users.userid
            JOIN items ON purchases.itemid=items.itemid
            where extract( year from date) = 2021
            GROUP BY title
            ORDER BY revenue desc
            limit 3) as table1;
```