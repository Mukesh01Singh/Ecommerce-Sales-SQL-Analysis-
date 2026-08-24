USE target;

-- 1.A Data types of customers columns
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'target'
  AND table_name = 'customers';


-- 1.B Order date range
SELECT
    MIN(order_purchase_timestamp) AS first_order_date,
    MAX(order_purchase_timestamp) AS last_order_date
FROM orders;


-- 1.C Total cities and states
SELECT
    COUNT(DISTINCT customer_city) AS total_cities,
    COUNT(DISTINCT customer_state) AS total_states
FROM customers;


-- 2.A Yearly order trend
SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY order_year;


-- 2.B Monthly seasonality
SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    MONTH(order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY order_year, order_month;


-- 2.C Orders by time of day
SELECT
    CASE
        WHEN HOUR(order_purchase_timestamp) BETWEEN 0 AND 6 THEN 'Dawn'
        WHEN HOUR(order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'Morning'
        WHEN HOUR(order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
        ELSE 'Night'
    END AS time_of_day,
    COUNT(*) AS total_orders
FROM orders
GROUP BY time_of_day
ORDER BY total_orders DESC;


-- 3.A Month-on-month orders by state
SELECT
    c.customer_state,
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
    COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state, order_month
ORDER BY c.customer_state, order_month;


-- 3.B Customers by state
SELECT
    customer_state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;


-- 4.A Percentage increase: 2017 vs 2018
WITH yearly_payments AS (
    SELECT
        YEAR(o.order_purchase_timestamp) AS year,
        SUM(p.payment_value) AS total_payment
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE MONTH(o.order_purchase_timestamp) BETWEEN 1 AND 8
      AND YEAR(o.order_purchase_timestamp) IN (2017, 2018)
    GROUP BY YEAR(o.order_purchase_timestamp)
)
SELECT
    y2017.total_payment AS payment_2017,
    y2018.total_payment AS payment_2018,
    ROUND(
        (y2018.total_payment - y2017.total_payment)
        * 100 / y2017.total_payment, 2
    ) AS percentage_increase
FROM yearly_payments y2017
JOIN yearly_payments y2018
    ON y2017.year = 2017
   AND y2018.year = 2018;


-- 4.B Total and average order price by state
SELECT
    c.customer_state,
    ROUND(SUM(oi.price), 2) AS total_order_value,
    ROUND(AVG(oi.price), 2) AS avg_order_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_order_value DESC;


-- 4.C Total and average freight by state
SELECT
    c.customer_state,
    ROUND(SUM(oi.freight_value), 2) AS total_freight_value,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight_value
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_freight_value DESC;


-- 5.A Delivery time
SELECT
    order_id,
    TIMESTAMPDIFF(
        DAY,
        order_purchase_timestamp,
        order_delivered_customer_date
    ) AS time_to_deliver_days,
    TIMESTAMPDIFF(
        DAY,
        order_delivered_customer_date,
        order_estimated_delivery_date
    ) AS diff_estimated_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


-- 5.B Top 5 states: highest average freight
SELECT
    c.customer_state,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_freight DESC
LIMIT 5;


-- 5.C Top 5 states: lowest average freight
SELECT
    c.customer_state,
    ROUND(AVG(oi.freight_value), 2) AS avg_freight
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY avg_freight ASC
LIMIT 5;


-- 5.D Top 5 states: highest average delivery time
SELECT
    c.customer_state,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                o.order_purchase_timestamp,
                o.order_delivered_customer_date
            )
        ), 2
    ) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 5;


-- 5.E Top 5 states: lowest average delivery time
SELECT
    c.customer_state,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                o.order_purchase_timestamp,
                o.order_delivered_customer_date
            )
        ), 2
    ) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days ASC
LIMIT 5;


-- 5.F States with faster delivery than estimated
SELECT
    c.customer_state,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                o.order_delivered_customer_date,
                o.order_estimated_delivery_date
            )
        ), 2
    ) AS avg_days_early
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_days_early DESC
LIMIT 5;


-- 6.A Month-on-month orders by payment type
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS order_month,
    p.payment_type,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY order_month, p.payment_type
ORDER BY order_month, total_orders DESC;


-- 6.B Orders by payment installments
SELECT
    payment_installments,
    COUNT(DISTINCT order_id) AS total_orders
FROM payments
GROUP BY payment_installments
ORDER BY payment_installments;
