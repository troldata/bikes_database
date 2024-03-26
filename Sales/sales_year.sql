-- Determine the time interval of data in the database to correctly interpret the results.

--SELECT min(order_date), max(order_date)
-- FROM orders

-- Calculate the percentage change in sales from year to year.
-- Window function LAG() is used to find the income in previous year.

SELECT EXTRACT(YEAR FROM o.order_date) AS year_current,
    SUM(quantity) AS sum_quantity,
    SUM(oi.quantity*(oi.list_price*(1-oi.discount))) AS sum_income,
    LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date)) AS income_last_year,
round(((SUM(oi.quantity*(oi.list_price*(1-oi.discount))) - LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date))) / LAG(SUM(oi.quantity*(oi.list_price*(1-oi.discount)))) OVER (ORDER BY EXTRACT(YEAR FROM o.order_date)) * 100),2) AS growth_percentage
FROM order_items oi 
	JOIN products p ON oi.product_id = p.product_id
	JOIN orders o ON o.order_id=oi.order_id
GROUP BY year_current
ORDER BY year_current;
