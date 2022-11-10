--Задание Г
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