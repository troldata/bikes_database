# Stock management for the bicycle shop chain.

Efficient inventory management allows to optimize delivery processes and ensure the necessary inventory in each store. This helps improve customer service and prevent missed sales.
In this work, the database model of a bicycle shop chain in PostgreSQL is used. Analysis of sales and inventory data was conducted to sell out unpopular models and order popular bikes in stock. The process of loading (ETL-process) new data about the bikes arriving in the warehouse has been developed and automated.

Aims of this work:
+ Analysis of the company's income for 2018.
+ Optimization of warehouse use.
+ Development of loading new data from suppliers.

The program pgAdmin 4 version 8.2. is used for administration and development of PostgreSQL database.

## Sources:
+ [Bike Store Relational Database | SQL](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database/data)
+ File bikes_World_of_Bikes.csv is generated for the project. It is located in the project repository.

## Database diagram
![Schema](https://github.com/troldata/bikes_database/blob/dev/database_diagram.jpg)

The database includes nine Tables in one scheme named public.

## Execution
1. Download all files from sources.
2. Create database named bikes in the programm pgAdmin 4
```
CREATE DATABASE bikes;
```
3. Add all tables with data and connections between them, according to the  database diagram (Queries from the Tables folder)
4. Sales analysis (Sales folder)
5. Stock analysis (Stock folder)
6. Add the new data from supplyer (New data folder; data from file bikes_World_of_Bikes.csv)

If the order in which queries are executed is important, the files in the folder are numbered. File paths should be replaced with actual data.

When loading data again, you only need to call the get_data procedure that automatically adds new information to the corresponding tables:
```
CALL get_data();
```



