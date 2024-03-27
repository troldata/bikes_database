--Sellers search often the products by name, so  we сreate indexes of product_name for quick search

CREATE INDEX idx_product_name on products(product_name)