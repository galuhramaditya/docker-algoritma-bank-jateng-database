-- Active: 1720035729684@@localhost@5432@algoritma
CREATE TABLE gold.datamart_denormalized_orders
AS
SELECT
    order_date,
    category,
    SUM(quantity) total_sold
FROM silver.transformed_denormalized_orders
GROUP BY order_date, category
ORDER BY order_date, category