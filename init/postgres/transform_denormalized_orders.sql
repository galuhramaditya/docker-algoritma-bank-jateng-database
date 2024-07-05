CREATE TABLE silver.transformed_denormalized_orders
AS
SELECT
    order_id,
    order_date,
    customer_id,
    UPPER(customer_name) AS customer_name,
    customer_address,
    product_id,
    product_name,
    category,
    quantity,
    price,
    total_amount
FROM denormalized.orders
WHERE order_date >= '2023-01-02'