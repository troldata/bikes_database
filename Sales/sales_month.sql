-- Calculate the percentage change in sales from month to month in 2018.
-- Window function LAG() is used to find the income in previous month.

SELECT EXTRACT(MONTH FROM o.order_date) AS month_current,
    SUM(quantity) AS sum_quantity,
    SUM(oi.quantity*(oi.list_price*(1-oi.discount))) AS sum_income,
    LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(MONTH FROM o.order_date)) AS income_last_month,
	round(((SUM(oi.quantity*(oi.list_price*(1-oi.discount))) - LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(MONTH FROM o.order_date))) / LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(MONTH FROM o.order_date)) * 100),2) AS growth_percentage
FROM order_items oi 
	JOIN products p ON oi.product_id = p.product_id
	JOIN orders o ON o.order_id=oi.order_id
WHERE EXTRACT(YEAR FROM o.order_date)=2018	
GROUP BY month_current
ORDER BY month_current;
