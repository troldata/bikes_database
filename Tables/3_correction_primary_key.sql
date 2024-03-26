--Create automatic incrementation of the primary key, starting from the next one after the maximum one in the table.
DO $$
DECLARE
    seq_name varchar;
    max_id int;
BEGIN
    -- for the table stores
    SELECT pg_get_serial_sequence('public.stores', 'store_id') INTO seq_name;
    SELECT max(store_id) + 1 INTO max_id FROM stores; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id);

    -- for the table staffs
    SELECT pg_get_serial_sequence('public.staffs', 'staff_id') INTO seq_name;
    SELECT max(staff_id) + 1 INTO max_id FROM staffs; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );

    -- for the table categories
    SELECT pg_get_serial_sequence('public.categories', 'category_id') INTO seq_name;
    SELECT max(category_id) + 1 INTO max_id FROM categories; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );

    -- for the table brand
    SELECT pg_get_serial_sequence('public.brands', 'brand_id') INTO seq_name;
    SELECT max(brand_id) + 1 INTO max_id FROM brands; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );

    -- for the table products
    SELECT pg_get_serial_sequence('public.products', 'product_id') INTO seq_name;
    SELECT max(product_id) + 1 INTO max_id FROM products; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );

    -- for the table customers
    SELECT pg_get_serial_sequence('public.customers', 'customer_id') INTO seq_name;
    SELECT max(customer_id) + 1 INTO max_id FROM customers; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );

    -- for the table orders
    SELECT pg_get_serial_sequence('public.orders', 'order_id') INTO seq_name;
    SELECT max(order_id) + 1 INTO max_id FROM orders; 
    RAISE NOTICE 'seq name % max id %', seq_name , max_id ;
    EXECUTE format('ALTER SEQUENCE %s RESTART WITH %s', seq_name, max_id );
END $$;