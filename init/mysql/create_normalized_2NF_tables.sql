-- Active: 1720035692713@@localhost@3306@algoritma
CREATE DATABASE IF NOT EXISTS normalized;

USE normalized;

-- create table customers from orders 1NF
CREATE TABLE IF NOT EXISTS normalized.customers
(PRIMARY KEY (customer_id))
SELECT DISTINCT
    customer_id,
    customer_name,
    customer_address
FROM denormalized.orders;

-- create table products from orders 1NF
CREATE TABLE IF NOT EXISTS normalized.products
(PRIMARY KEY (product_id))
SELECT DISTINCT
    product_id,
    product_name,
    category,
    price
FROM denormalized.orders;

-- create table orders from orders 1NF
CREATE TABLE IF NOT EXISTS normalized.orders
(PRIMARY KEY (order_id))
SELECT DISTINCT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM denormalized.orders;

ALTER TABLE normalized.orders
ADD CONSTRAINT orders_customer_id FOREIGN KEY(customer_id) REFERENCES normalized.customers(customer_id);

-- create table order_details from orders 1NF
CREATE TABLE IF NOT EXISTS normalized.order_details
SELECT DISTINCT
    order_id,
    product_id,
    quantity
FROM denormalized.orders;

ALTER TABLE normalized.order_details
ADD CONSTRAINT order_details_order_id FOREIGN KEY(order_id) REFERENCES normalized.orders(order_id);

ALTER TABLE normalized.order_details
ADD CONSTRAINT order_details_product_id FOREIGN KEY(product_id) REFERENCES normalized.products(product_id);