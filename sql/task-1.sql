--Задание А
--пункт 1
SELECT FLOOR(AVG(price)) as avg_price26_35
from Items
JOIN Purchases on Items.itemId = Purchases.itemId
JOIN Users on Purchases.userid = Users.userid
WHERE age BETWEEN 26 and 35;
--пункт 2
SELECT FLOOR(AVG(price)) as avg_price18_25
from Items
JOIN Purchases on Items.itemId = Purchases.itemId
JOIN Users on Purchases.userid = Users.userid
WHERE age BETWEEN 18 and 25;