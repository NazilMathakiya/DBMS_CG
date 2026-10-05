CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    amount NUMERIC,
    year INT
);
INSERT INTO orders (customer_name, amount, year)
VALUES
('Motu', 5000, 2026),
('Patlu', 8000, 2026),
('Raju', 3002, 2025),
('Shyam', 7001, 2023);   

--Using CTE:
WITH order_data AS (
    SELECT *
    FROM orders
)
SELECT *
FROM order_data;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    amount NUMERIC,
    year INT
);

INSERT INTO orders (customer_name, amount, year)
VALUES
('Motu', 5000, 2026),
('Patlu', 8000, 2026),
('Raju', 3000, 2025),
('Shyam', 7000, 2026);


-- Q1. Create a CTE to display all orders from 2026.

WITH orders_2026 AS (
    SELECT *
    FROM orders
    WHERE year = 2026
)
SELECT *
FROM orders_2026;


-- Q2. Create a CTE to display orders where amount is greater than 5000.

WITH high_orders AS (
    SELECT *
    FROM orders
    WHERE amount > 5000
)
SELECT *
FROM high_orders;


-- Q3. Create a CTE to calculate amount * 0.18 as tax.

WITH order_tax AS (
    SELECT
        order_id,
        customer_name,
        amount,
        amount * 0.18 AS tax
    FROM orders
)
SELECT *
FROM order_tax;


-- Q4. Create a CTE to find the total order amount for each customer.

WITH customer_total AS (
    SELECT
        customer_name,
        SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_name
)
SELECT *
FROM customer_total;


-- Q5. Create a CTE to display customers whose total order amount is greater than 10000.

WITH customer_total AS (
    SELECT
        customer_name,
        SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_name
)
SELECT *
FROM customer_total
WHERE total_amount > 10000;


-- Q6. Create a CTE to find the average order amount.

WITH average_order AS (
    SELECT AVG(amount) AS average_amount
    FROM orders
)
SELECT *
FROM average_order;


-- Q7. Create a CTE to find the maximum order amount.

WITH maximum_order AS (
    SELECT MAX(amount) AS maximum_amount
    FROM orders
)
SELECT *
FROM maximum_order;


-- Q8. Create a CTE to find the top 3 highest-value orders.

WITH top_orders AS (
    SELECT *
    FROM orders
    ORDER BY amount DESC
    LIMIT 3
)
SELECT *
FROM top_orders;


-- Q9. Create two CTEs where the second CTE uses the result of the first CTE.

WITH orders_2026 AS (
    SELECT *
    FROM orders
    WHERE year = 2026
),
high_orders AS (
    SELECT *
    FROM orders_2026
    WHERE amount > 5000
)
SELECT *
FROM high_orders;


-- Q10. Use a CTE with GROUP BY to find yearly sales.

WITH yearly_sales AS (
    SELECT
        year,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY year
)
SELECT *
FROM yearly_sales;


-- Q11. Use a CTE with HAVING to find customers whose total sales exceed 5000.

WITH customer_sales AS (
    SELECT
        customer_name,
        SUM(amount) AS total_sales
    FROM orders
    GROUP BY customer_name
    HAVING SUM(amount) > 5000
)
SELECT *
FROM customer_sales;


-- Q12. Use a CTE with a JOIN to display customer names and their total orders.

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO customers (customer_name)
VALUES
('Motu'),
('Patlu'),
('Raju'),
('Shyam');

WITH customer_orders AS (
    SELECT
        customer_name,
        SUM(amount) AS total_orders
    FROM orders
    GROUP BY customer_name
)
SELECT
    c.customer_name,
    co.total_orders
FROM customers c
JOIN customer_orders co
    ON c.customer_name = co.customer_name;


-- Q13. Use a CTE to identify orders before 2026 and delete them from the orders table.

WITH old_orders AS (
    SELECT order_id
    FROM orders
    WHERE year < 2026
)
DELETE FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM old_orders
);

































































































































