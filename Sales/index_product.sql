--Sellers search often the products by name, so  we сreate indexes of product_name for quick search
CREATE INDEX idxProductName on products(product_name)