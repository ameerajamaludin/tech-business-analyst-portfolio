-- LEVEL 5 — Advanced Analysis

-- Mission 1
-- What is our customer retention?

WITH monthly_customers AS (
    SELECT DISTINCT
        DATE_TRUNC('month', order_date) AS month,
        user_id
    FROM orders
    WHERE status = 'completed'
),

retained_customers AS (
    SELECT
        m1.month,
        COUNT(DISTINCT m1.user_id) AS customers_previous_month,
        COUNT(DISTINCT m2.user_id) AS retained_customers
    FROM monthly_customers m1
    LEFT JOIN monthly_customers m2
        ON m1.user_id = m2.user_id
        AND m2.month = m1.month + INTERVAL '1 month'
    GROUP BY m1.month
)

SELECT
    month,
    customers_previous_month,
    CASE
        WHEN month = (SELECT MAX(month) FROM monthly_customers)
        THEN NULL
        ELSE retained_customers
    END AS retained_customers,
    CASE
        WHEN month = (SELECT MAX(month) FROM monthly_customers)
        THEN NULL
        ELSE ROUND(
            retained_customers * 100.0 / customers_previous_month,
            2
        )
    END AS retention_rate
FROM retained_customers
ORDER BY month;

-- Mission 2
-- Rank products by revenue within each category.

WITH product_revenue AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * oi.price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'completed'
    GROUP BY
        p.category,
        p.product_name
)

SELECT
    category,
    product_name,
    revenue,
    RANK() OVER (
        PARTITION BY category
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM product_revenue
ORDER BY category, revenue_rank;


-- Mission 3
-- Calculate month-over-month revenue growth.

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(oi.quantity * oi.price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY DATE_TRUNC('month', o.order_date)
)

SELECT
    month,
    revenue,
    LAG(revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,
    ROUND(
        (
            revenue - LAG(revenue) OVER (ORDER BY month)
        ) * 100.0
        / LAG(revenue) OVER (ORDER BY month),
        2
    ) AS mom_growth_percentage
FROM monthly_revenue
ORDER BY month;


-- Mission 4
-- Identify customers whose spending is above average.

WITH customer_spending AS (
    SELECT
        u.user_id,
        SUM(oi.quantity * oi.price) AS total_spending
    FROM users u
    JOIN orders o
        ON u.user_id = o.user_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.status = 'completed'
    GROUP BY u.user_id
)

SELECT
    user_id,
    total_spending
FROM customer_spending
WHERE total_spending > (
    SELECT AVG(total_spending)
    FROM customer_spending
)
ORDER BY total_spending DESC;
