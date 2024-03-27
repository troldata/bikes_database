--Stored procedure with data validation.
--If one of the checks fails, a corresponding message will be sent.

CREATE OR REPLACE PROCEDURE validate_stg()
LANGUAGE plpgsql
AS $$	
--Declare local variables using to store results.
DECLARE 
	total_count INT;
	numeric_price_count INT;
	numeric_quantity_count INT;
	positive_price_count INT;
	positive_quantity_count INT;
	
BEGIN
-- call validate_stg()
    -- Count the number of rows in the staging table
	SELECT count(*) 
	INTO total_count 
	FROM stg_bikes;
   	 RAISE NOTICE 'Number of rows in stg_bikes: %', total_count;
	
   	 -- Check whether all values of the price and quantity fields can be converted to numbers.
      SELECT COUNT(*) INTO numeric_price_count
      FROM stg_bikes
    	WHERE isnumeric(price); -- The isnumeric() function is used.
	IF numeric_price_count < total_count THEN
		RAISE NOTICE 'The price is not numeric'; 
	END IF;
	
	SELECT COUNT(*) INTO numeric_quantity_count
   	FROM stg_bikes
   	WHERE quantity ~ E'^\\d+$';  --The regular expression is used.
	IF numeric_quantity_count < total_count THEN
		RAISE NOTICE 'The quantity is not numeric'; 
	END IF;	
	
    -- Check that all values of the price and quantity fields are not negative values.
	SELECT COUNT(*) INTO positive_price_count
    	FROM stg_bikes
	WHERE CAST(price AS DECIMAL) >=0;
	IF positive_price_count < total_count THEN
		RAISE NOTICE 'The price is negative value'; 
	END IF;	
	
	SELECT COUNT(*) INTO positive_quantity_count
   	FROM stg_bikes
	WHERE CAST(quantity AS INT) >=0;
	IF positive_quantity_count < total_count THEN
		RAISE NOTICE 'The quantity is negative value'; 
	END IF;		

END;    
$$;
