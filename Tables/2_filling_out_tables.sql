-- !!! Change security settings for all files
-- File -> Properties -> Security -> Edit -> Add everyone -> Ok

-- Copy data in the empty tables
-- Copy data in the table stores
copy stores
from 'Path to stores.csv'
delimiter ','
csv
header;

-- Copy data in the table staffs
copy staffs
from 'Path to staffs.csv'
delimiter ','
csv
header;

-- Copy data in the table categories
copy categories
from 'Path to categories.csv'
delimiter ','
csv
header;

-- Copy data in the table brands
copy brands
from 'Path to brands.csv'
delimiter ','
csv
header;

-- Copy data in the table products
copy products
from 'Path to products.csv'
delimiter ','
csv
header;

-- Copy data in the table customers
copy customers
from 'Path to customers.csv'
delimiter ','
csv
header;

-- Copy data in the table orders
copy orders
from 'Path to orders.csv'
delimiter ','
csv
header;

-- Copy data in the table order_items
copy order_items
from 'Path to order_items.csv'
delimiter ','
csv
header;

-- Copy data in the table stocks
copy stocks
from 'Path to stocks.csv'
delimiter ','
csv
header;
