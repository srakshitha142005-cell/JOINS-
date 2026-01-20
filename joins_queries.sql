
-- 1. INNER JOIN: Orders with Customer details
SELECT 
    o.order_id,
    c.name AS customer_name,
    c.region,
    o.order_date,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- 2. LEFT JOIN: Customers who never placed any orders
SELECT 
    c.customer_id,
    c.name,
    c.email
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 3. Revenue per Product
SELECT 
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

-- 4. Category-wise Revenue
SELECT 
    cat.category_name,
    SUM(oi.quantity * p.price) AS category_revenue
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id
INNER JOIN categories cat
ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY category_revenue DESC;

-- 5. Sales in a specific region between dates
SELECT 
    c.region,
    o.order_date,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.region = 'South'
AND o.order_date BETWEEN '2024-01-01' AND '2024-12-31';
