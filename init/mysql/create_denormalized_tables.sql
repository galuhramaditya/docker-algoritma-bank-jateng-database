-- Active: 1720035692713@@localhost@3306@algoritma
CREATE DATABASE IF NOT EXISTS denormalized;

USE denormalized;

CREATE TABLE EXISTS orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, order_date, customer_id, customer_name, customer_address, product_id, product_name, category, quantity, price, total_amount) VALUES 
(1, '2023-01-01', 1, 'John Doe', '123 Elm St', 1, 'Laptop', 'Electronics', 1, 799.99, 1015.97), 
(1, '2023-01-01', 1, 'John Doe', '123 Elm St', 2, 'Headphones', 'Electronics', 1, 199.99, 1015.97), 
(1, '2023-01-01', 1, 'John Doe', '123 Elm St', 3, 'Coffee Mug', 'Kitchen', 1, 15.99, 1015.97), 
(2, '2023-01-02', 2, 'Jane Smith', '456 Oak St', 2, 'Headphones', 'Electronics', 1, 199.99, 215.98), 
(2, '2023-01-02', 2, 'Jane Smith', '456 Oak St', 3, 'Coffee Mug', 'Kitchen', 1, 15.99, 215.98);