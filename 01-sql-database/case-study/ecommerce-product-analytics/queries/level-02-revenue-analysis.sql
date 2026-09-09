-- LEVEL 2 — Revenue Analysis

-- Mission 1
-- How much revenue did we generate?
SELECT SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'completed';


-- Mission 2
-- What is our revenue by month?

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


-- Mission 3
-- What is our revenue by product category?

SELECT
    p.category,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY total_revenue DESC;


-- Mission 4
-- Which country generates the most revenue?

SELECT
    u.country,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN users u
    ON o.user_id = u.user_id
WHERE o.status = 'completed'
GROUP BY u.country
ORDER BY total_revenue DESC;
