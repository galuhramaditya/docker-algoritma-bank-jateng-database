-- Active: 1720035729684@@localhost@5432@algoritma
-- create dimension table customer
CREATE TABLE IF NOT EXISTS dimensional.dim_customers AS
SELECT DISTINCT
    customer_id,
    customer_name,
    customer_address
FROM denormalized.orders;

-- create dimension table products
CREATE TABLE IF NOT EXISTS dimensional.dim_products AS
SELECT DISTINCT
    product_id,
    product_name,
    category,
    price
FROM denormalized.orders;

-- create fact table orders
CREATE TABLE IF NOT EXISTS dimensional.fact_orders AS
SELECT
    order_id,
    order_date,
    customer_id,
    product_id,
    quantity,
    total_amount
FROM denormalized.orders;