--Find all models in stock that are not in demand (they have not been purchased).

SELECT stores.store_id, stores.store_name, p.product_name, s.quantity
FROM stocks s
JOIN stores ON s.store_id=stores.store_id
JOIN products p ON p.product_id=s.product_id
WHERE p.product_id NOT IN 
	(SELECT oi.product_id 
	 FROM order_items oi  
	 	JOIN orders o ON o.order_id=oi.order_id
  );

-- 24 models have never been purchased and are in stocks.
-- It is necessary to sell out these models and order popular bikes. 
-- The 2016 models are definitely sold out.