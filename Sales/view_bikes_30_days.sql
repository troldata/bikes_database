--  Create view with information about the most popular bikes in sales over the last 30 days.

CREATE VIEW vSalesLastMonth AS
SELECT o.order_date,
	p.product_name,
	SUM(quantity) AS sum_quantity,
	o.store_id
FROM order_items oi 
	JOIN products p ON oi.product_id = p.product_id 
	JOIN orders o ON o.order_id=oi.order_id
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY o.order_date, p.product_name, o.store_id
ORDER BY sum_quantity DESC;
