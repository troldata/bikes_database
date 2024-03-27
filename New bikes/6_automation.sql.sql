-- Automate the upload process
--The stored procedure sequentially calls stored procedures to load data into the staging table, validate the data, and load data into the database. 
-- At the end of each procedure, a message indicating successful completion is sent.

CREATE OR REPLACE PROCEDURE get_data()
LANGUAGE plpgsql
AS $$
BEGIN
    CALL load_data_to_stg();
    RAISE NOTICE 'Procedure load_data_to_stg completed successfully';
    
    CALL validate_stg();
    RAISE NOTICE 'Procedure validate_stg completed successfully';
    
    CALL load_data_from_stg();
    RAISE NOTICE 'Procedure load_data_from_stg completed successfully';  
	
	RAISE NOTICE 'The New data loaded successfully'; 
END;
$$;

