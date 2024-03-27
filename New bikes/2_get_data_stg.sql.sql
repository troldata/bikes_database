--The stored procedure to load data from the CSV file into the staging table.
--At first the table is cleaned, then new data is copied from the supplier file bikes_World_of_Bikes.csv.

CREATE OR REPLACE PROCEDURE load_data_to_stg()
LANGUAGE plpgsql
AS $$	
BEGIN 

    TRUNCATE TABLE stg_bikes;
	
    COPY stg_bikes(date_delivery, bike_id, bike_name, color, category, model_year, price, quantity, store)
    FROM 'Path to file bikes_World_of_Bikes.csv'
    WITH CSV HEADER;
	
END;
$$;
