--Задание В
SELECT title, sum(price) as revenue
FROM purchases
JOIN users on purchases.userid=users.userid
JOIN items ON purchases.itemid=items.itemid
where extract( year from date) = 2021
GROUP BY title
order by revenue desc
limit 1;