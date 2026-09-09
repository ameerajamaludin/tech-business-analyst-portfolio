-- LEVEL 3 — Business Performance

-- Mission 1
-- What is our average order value?
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        o.order_id,
        SUM(oi.quantity * oi.price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY o.order_id
) AS order_totals;


-- Mission 2
-- Which acquisition channel generates the most customers?
SELECT
    acquisition_channel,
    COUNT(*) AS total_customers
FROM users
GROUP BY acquisition_channel
ORDER BY total_customers DESC;


-- Mission 3
-- Which acquisition channel generates the most revenue?
SELECT
    u.acquisition_channel,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM users u
JOIN orders o
    ON u.user_id = o.user_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'completed'
GROUP BY u.acquisition_channel
ORDER BY total_revenue DESC;


-- Mission 4
-- What percentage of users actually make a purchase?

SELECT
    ROUND(
        COUNT(DISTINCT CASE
            WHEN o.status = 'completed' THEN u.user_id
        END) * 100.0
        / COUNT(DISTINCT u.user_id),
        2
    ) AS purchase_percentage
FROM users u
LEFT JOIN orders o
    ON u.user_id = o.user_id;
