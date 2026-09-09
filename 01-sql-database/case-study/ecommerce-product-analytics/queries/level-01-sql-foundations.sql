-- ============================================================
-- Level 1 — SQL Foundations
-- ============================================================


-- 1. How many users do we have?

SELECT COUNT(*) AS total_users
FROM users;


-- 2. How many orders do we have?

SELECT COUNT(*) AS total_orders
FROM orders;


-- 3. What are our 10 most expensive products?

SELECT product_name as most_expensive_products, price
FROM products
ORDER BY price DESC
LIMIT 10;