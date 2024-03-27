
--Check how many bikes are still in stock that were sold at the third store last month.
-- Based on the result of this request, the seller places an order to the supplier.

SELECT stores.store_id, stores.store_name, p.product_name, s.quantity
FROM stocks s
	JOIN stores ON s.store_id=stores.store_id
	JOIN products p ON p.product_id=s.product_id
WHERE product_name IN 
	(SELECT p.product_name
	FROM order_items oi 
		JOIN products p ON oi.product_id = p.product_id 
		JOIN orders o ON o.order_id=oi.order_id
	WHERE order_date >= '2018-12-28'::date - INTERVAL '30 days'
     ) AND stores.store_id=3
