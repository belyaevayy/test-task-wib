--Задание Б
SELECT  EXTRACT(month from date) as month,sum(price) as sum
FROM purchases
JOIN users on purchases.userid=users.userid
JOIN items ON purchases.itemid=items.itemid
WHERE extract(YEAR from date) = 2020 and age > 35
GROUP by month
ORDER BY sum DESC
limit 1;