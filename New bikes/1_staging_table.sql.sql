-- Create stage table
-- In this step it is important to simply load the data as is, so that the format for all fields is string.

CREATE TABLE stg_bikes (
	date_delivery varchar(255),
	bike_id varchar(255),
	bike_name varchar(255),
	color varchar(255),
	category varchar(255),
	model_year varchar(255),
	price varchar(255),
	quantity varchar(255),
	store varchar(255)
);
