-- create database ecommerce;
use ecommerce;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(50),
    customer_state VARCHAR(50)
);
-- SET FOREIGN_KEY_CHECKS = 0;


select count(*) from customers;
-- TRUNCATE TABLE customers;


CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME,
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

-- Load dataset in order
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_status,
 @purchase, @approved,
 @carrier_date, @customer_date,
 @estimated_date)
SET
order_purchase_timestamp = NULLIF(@purchase, ''),
order_approved_at = NULLIF(@approved, ''),
order_delivered_carrier_date = NULLIF(@carrier_date, ''),
order_delivered_customer_date = NULLIF(@customer_date, ''),
order_estimated_delivery_date = NULLIF(@estimated_date, '');

-- Alter table  
ALTER TABLE orders
MODIFY order_purchase_timestamp DATETIME NULL,
MODIFY order_approved_at DATETIME NULL,
MODIFY order_delivered_carrier_date DATETIME NULL,
MODIFY order_delivered_customer_date DATETIME NULL,
MODIFY order_estimated_delivery_date DATETIME NULL;


select count(*) from orders;

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(50),
    product_name_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

Show variables like 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_category_name, 
 @name_len, @desc_len, @photos_qty,
 @weight, @length, @height, @width)
SET
product_name_length = NULLIF(@name_len, ''),
product_description_length = NULLIF(@desc_len, ''),
product_photos_qty = NULLIF(@photos_qty, ''),
product_weight_g = NULLIF(@weight, ''),
product_length_cm = NULLIF(@length, ''),
product_height_cm = NULLIF(@height, ''),
product_width_cm = NULLIF(@width, '');

alter table products
add product_description_length int;

alter table products
modify column product_name_length int null;
alter table products
MODIFY product_photos_qty INT NULL;

ALTER TABLE products 
MODIFY product_category_name VARCHAR(100) NULL,
MODIFY product_weight_g INT NULL,
MODIFY product_length_cm INT NULL,
MODIFY product_height_cm INT NULL,
MODIFY product_width_cm INT NULL,
MODIFY product_description_length INT NULL;

select count(*) from products;


CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price decimal(10,2),
    freight_value DECIMAL(10 , 2 ),
    PRIMARY KEY (order_id , order_item_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from order_items;


CREATE TABLE payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10 , 2 ),
    PRIMARY KEY (order_id , payment_sequential),
    FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_payments_dataset.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select count(*) from payments;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;

select * from customers;
select * from products;
select * from orders;
select * from order_items;
select * from payments;

