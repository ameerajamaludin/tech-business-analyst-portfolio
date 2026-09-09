-- LEVEL 4 — Customer Analysis

-- Mission 1
-- Who are our repeat customers?

SELECT
    u.user_id,
    COUNT(o.order_id) AS completed_orders
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
WHERE o.status = 'completed'
GROUP BY u.user_id
HAVING COUNT(o.order_id) >= 2
ORDER BY completed_orders DESC;


-- Mission 2
-- What is our repeat purchase rate?

SELECT
    COUNT(*) FILTER (WHERE completed_orders >= 2) * 100.0
    / COUNT(*) AS repeat_purchase_rate
FROM (
    SELECT
        u.user_id,
        COUNT(o.order_id) AS completed_orders
    FROM users u
    JOIN orders o
        ON u.user_id = o.user_id
    WHERE o.status = 'completed'
    GROUP BY u.user_id
) AS customer_orders;


-- Mission 3
-- How many new users do we acquire each month?
SELECT
    DATE_TRUNC('month', signup_date) AS signup_month,
    COUNT(*) AS new_users
FROM users
GROUP BY DATE_TRUNC('month', signup_date)
ORDER BY signup_month;


-- Mission 4
-- What is our Monthly Active Users (MAU)?

SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(DISTINCT o.user_id) AS mau
FROM orders o
WHERE o.status = 'completed'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;


-- Mission 5
-- What is our Average Revenue Per User (ARPU)?

SELECT
    SUM(oi.quantity * oi.price) / COUNT(DISTINCT u.user_id) AS arpu
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id
    AND o.status = 'completed'
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id;
