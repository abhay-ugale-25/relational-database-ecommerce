-- top 3 customers based on their total spending
SELECT sum(orders.total_amt),
    name
FROM customer
    JOIN orders ON customer.cust_id = orders.cust_id
GROUP BY customer.name
ORDER BY sum(total_amt) DESC
LIMIT 3;

-- List all products along with their total quantity sold.
-- If a product was never sold, show it with 0 quantity.
SELECT name,
    COALESCE(sum(orderitem.quantity), 0)
FROM product
    LEFT JOIN orderitem on product.prod_id = orderitem.prod_id
GROUP BY product.name
ORDER BY sum(quantity) DESC;

-- For each customer, show their name, total amount paid, and number of orders.
SELECT customer.name AS Name,
    COALESCE(sum(payments.amount_paid), 0) AS Amount_Paid,
    COUNT(DISTINCT orders.order_id) AS Total_orders
FROM customer
    LEFT JOIN orders ON customer.cust_id = orders.cust_id
    LEFT JOIN payments ON orders.order_id = payments.order_id
GROUP BY customer.name;

-- Return each product category and the total revenue 
-- generated from all products in that category.
-- Revenue per item = unit_price * quantity.
SELECT product.category AS Category,
    sum(quantity * unit_price) AS Revenue
FROM orderitem
    LEFT JOIN product ON orderitem.prod_id = product.prod_id
GROUP BY category
ORDER BY Revenue DESC 

-- Get the names of customers and the names of products they have not ordered.
-- (Use an appropriate join to find this relationship between customers and products.)
SELECT customer.name AS Name,
    product.name AS Product,
    COALESCE((orderitem.quantity), 0) AS Quantity
FROM customer
    CROSS JOIN product
    LEFT JOIN orders ON orders.cust_id = customer.cust_id
    LEFT JOIN orderitem ON orderitem.order_id = orders.order_id
    AND orderitem.prod_id = product.prod_id
WHERE orderitem.quantity IS NULL 

-- A list of all customers and all products, including any possible purchases 
-- and also showing where there's no match (i.e., no purchase record from either side).
    CREATE VIEW FULL_JOIN AS(
        SELECT COALESCE((customer.name), "N/A") AS Name,
            COALESCE((product.name), "N/A") AS Product
        FROM customer
            LEFT JOIN orders ON customer.cust_id = orders.cust_id
            LEFT JOIN orderitem ON orders.order_id = orderitem.order_id
            LEFT JOIN product ON orderitem.prod_id = product.prod_id
        WHERE product.name IS NULL
        UNION
        SELECT COALESCE((customer.name), "N/A") AS Name,
            COALESCE((product.name), "N/A") AS Product
        FROM product
            RIGHT JOIN orderitem ON product.prod_id = orderitem.prod_id
            RIGHT JOIN orders ON orders.order_id = orderitem.order_id
            RIGHT JOIN customer ON orders.cust_id = customer.cust_id
        WHERE customer.name IS NULL
    )

-- total orders and amount spent per customer
CREATE VIEW customer_purchase_summary AS(
    SELECT customer.name AS NAME, COUNT(DISTINCT orders.order_id), COALESCE(sum((orders.total_amt)), 0) AS AMT_SPENT
    FROM customer
    LEFT JOIN orders ON customer.cust_id = orders.cust_id
    GROUP BY customer.cust_id
)

-- calculated category-wise revenue 
CREATE VIEW category_sales AS(
    SELECT product.category AS Category,
    sum(quantity * unit_price) AS Revenue
    FROM orderitem
    LEFT JOIN product ON orderitem.prod_id = product.prod_id
    GROUP BY category
)
