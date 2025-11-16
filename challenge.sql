-- Task 1
SELECT
  customers.first_name || ' ' || customers.last_name AS customer_name,
  SUM(order_items.quantity * order_items.unit_price) AS total_spend
FROM customers
JOIN orders ON orders.customer_id = customers.id
JOIN order_items ON order_items.order_id = orders.id
GROUP BY customers.id
ORDER BY total_spend DESC
LIMIT 5;


-- Task 2
SELECT
  products.category,
  SUM(order_items.quantity * order_items.unit_price) AS revenue
FROM order_items
JOIN products ON products.id = order_items.product_id
GROUP BY products.category
ORDER BY revenue DESC;


