-- Active: 1720035692713@@localhost@3306@algoritma
CREATE DATABASE IF NOT EXISTS normalized;

USE normalized;

-- create table categories from products 2NF
CREATE TABLE IF NOT EXISTS normalized.categories
(PRIMARY KEY (category_id))
WITH categories AS (
    SELECT DISTINCT
        category
    FROM normalized.products
)
SELECT
    ROW_NUMBER() OVER() AS category_id,
    category AS category_name
FROM categories;

-- create table products from products 2NF
CREATE TABLE IF NOT EXISTS normalized.products_temp
(PRIMARY KEY (product_id))
SELECT
    products.product_id,
    products.product_name,
    categories.category_id,
    products.price
FROM normalized.products AS products
LEFT JOIN normalized.categories AS categories ON products.category = categories.category_name;

ALTER TABLE normalized.order_details
DROP FOREIGN KEY order_details_product_id;

DROP TABLE normalized.products;

ALTER TABLE normalized.products_temp
RENAME TO products;

ALTER TABLE normalized.order_details
ADD CONSTRAINT order_details_product_id FOREIGN KEY(product_id) REFERENCES normalized.products(product_id);