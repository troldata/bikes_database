--The stored procedure to transfer data from the staging table to tables in the bikes database.
--It is important to follow the order: first add existing models and then new ones.
-- Otherwise, the number of new model bikes in the warehouse will be doubled.
-- All variables with non-string values should be converted to the appropriate format using the CAST() function.


CREATE OR REPLACE PROCEDURE load_data_from_stg()
LANGUAGE 'plpgsql'
AS $$

BEGIN 
--call loadData()

     -- Change the number of bikes in the stocks table for models, wich present in both tables (stg_bikes and stocks)
    UPDATE stocks s
	SET quantity = s.quantity + CAST(stg.quantity AS INT)
	FROM stg_bikes stg 
	JOIN products p ON stg.bike_name=p.product_name
	WHERE s.product_id=p.product_id 
		AND CAST(stg.store AS INT)=s.store_id;
		
    -- Add new data from staging table that is not in the main tables
    -- At first all dictionaries (brands, categories, products) are filled, then the stocks table.
		-- in brands
	INSERT INTO brands(brand_name) 
	SELECT DISTINCT split_part(bike_name, ' ', 1)
	FROM stg_bikes
	WHERE split_part(bike_name, ' ', 1) NOT IN (SELECT split_part(brand_name, ' ', 1) FROM brands);
	
    -- in categories
	INSERT INTO categories(category_name) 
	SELECT DISTINCT category
	FROM stg_bikes
	WHERE category NOT IN (SELECT category_name FROM categories);
	
	-- in products
    INSERT INTO products (product_name, brand_id, category_id, model_year, list_price)
    SELECT DISTINCT s.bike_name, b.brand_id, c.category_id, CAST(s.model_year AS INT), CAST(s.price AS numeric)
    FROM stg_bikes s
    JOIN brands b ON split_part(s.bike_name, ' ', 1) = b.brand_name
	JOIN categories c ON s.category=c.category_name
    WHERE s.bike_name not in (SELECT product_name FROM products);
	
	-- in stocks
	INSERT INTO stocks (store_id, product_id, quantity)
    SELECT stores.store_id, p.product_id, CAST(s.quantity AS INT)
    FROM stg_bikes s
    JOIN stores ON CAST(s.store AS INT) = stores.store_id
	JOIN products p ON s.bike_name=p.product_name
    WHERE p.product_id not in (SELECT product_id FROM stocks);
	
    -- Complete the transaction	
END;
$$;
