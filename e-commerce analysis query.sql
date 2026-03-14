use ecommerce;

-- Business KPis
-- 1. Total Revenue 
SELECT 
    ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM
    order_items;
    
-- 2 Total Number of Order
SELECT 
    COUNT(*) AS total_order
FROM
    orders;

-- 3 Total Number of Customers
select count(distinct customer_unique_id) as total_customer
from customers;

-- 4 Average Order Value
select round(sum(oi.price + oi.freight_value)/ count(distinct o.order_id),2)
as avg_order_value
from orders o
join order_items oi
on o.order_id = oi.order_id;

-- Sales Performance Anlysis
-- 5 Monthly Revenue Tend
select
date_format(o.order_purchase_timestamp,' %Y-%m') as month,
round(sum(oi.price + oi.freight_value),2) as monthly_revenue
from order_items oi
join orders o
on oi.order_id = o.order_id
group by month
order by month ASC;

-- 6 Monthly Order Volume

select
date_format(order_purchase_timestamp,'%Y-%m') as month,
count( order_id) as order_volume
from orders
group by month
order by month ASC;

-- 7 Top 10 Product Categories By revenue
SELECT 
p.product_category_name,
ROUND(SUM(oi.price + oi.freight_value), 2) AS product_revenue
FROM
    products p
    join order_items oi 
    on P.product_id = oi.product_id
    group by p.product_category_name
    order by product_revenue DESC
    limit 10;
    
    select
    p.product_category_name,
ROUND(SUM(oi.price + oi.freight_value), 2) AS product_revenue
FROM
    order_items oi
    join products p
    on oi.product_id = p.product_id
    group by p.product_category_name
    order by product_revenue DESC
    limit 10;
    
-- 8 Top 10 Most Sale Products
select p.product_category_name,
count(*) as sold_product
from  products p
group by p.product_category_name
order by sold_product DESC
limit 10;

SELECT 
product_id,
COUNT(*) AS total_sold
FROM order_items
GROUP BY product_id
ORDER BY total_sold DESC
LIMIT 10;

-- Customer Analysis
-- 9 Customers With Highest Orders
select customer_id,
count(order_id) as highest_order from
orders
group by customer_id
order by highest_order DESC
limit 5;

-- 10 Repeat Customers
select count(*) as repeat_customer
from(
select customer_id
from orders
group by customer_id
having count(order_id)> 1) as t;


-- 11 Customer Distribution by State
select customer_state, count(customer_id) as distribution
from customers
group by customer_state
order by distribution DESC
limit 5;


-- Payment  Analysis
-- 12 Most Used Payment Method

select payment_type, count(order_id) as used_payment
from payments
group by payment_type
order by used_payment desc
Limit 5;

-- 13 Average Payment Value

select round(avg( payment_value),2) as avg_payment_value
from payments;


-- 14 Total Revenue By Payment Type
select payment_type,
round(sum(oi.price + oi.freight_value),2) as revenue_by_payment
from payments p
join order_items oi
on p.order_id = oi.order_id
group by payment_type
order by revenue_by_payment DESC;

select payment_type,
round(sum(payment_value),2) as revenue_by_payment
from payments p
group by payment_type
order by revenue_by_payment DESC;

-- Order Processing And Delivery
-- 15 Average Delivery Time
select 
avg(datediff(order_delivered_customer_date,order_purchase_timestamp)) as avg_delivery_time
from orders;

-- 16 Delayed Deliveries

select count(*) as delayed_delivery
from orders
where order_delivered_customer_date >order_estimated_delivery_date;

-- Product Insights

-- 17 Average Price By Category
select product_category_name,
round(avg(oi.price),2) as avg_price_of_product
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_category_name
order by avg_price_of_product DESC;

-- 18 Most Expensive Product Sold

select product_category_name,
round(max(oi.price + oi.freight_value),2) as expensive_product
from products p
join order_items oi
on oi.product_id = p.product_id
group by product_category_name
order by expensive_product desc
limit 10;

SELECT 
product_id,
MAX(price) AS highest_price
FROM order_items
GROUP BY product_id
ORDER BY highest_price DESC
LIMIT 10;

-- 19 Revenue By Customer State

SELECT 
c.customer_state,
ROUND(SUM(oi.price + oi.freight_value),2) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;

-- 20 Orders Per Customer
SELECT 
customer_id,
COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
ORDER BY order_count DESC;

SELECT @@hostname;
