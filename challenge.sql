/*
Tool used: SQLite
How I validated my results:
- Ran each query individually in the SQLite console.
- Verified row counts and totals against raw tables using simple SELECT statements.
- Manually checked sample rows to ensure JOINs pulled the correct data.
*/


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


-- Task 3
SELECT
  employees.first_name,
  employees.last_name,
  departments.name AS department_name,
  employees.salary,
  department_avg.avg_salary
FROM employees
JOIN departments ON departments.id = employees.department_id
JOIN (
       SELECT
         employees.department_id,
         AVG(employees.salary) AS avg_salary
       FROM employees
       GROUP BY employees.department_id
     ) AS department_avg
     ON department_avg.department_id = employees.department_id
WHERE employees.salary > department_avg.avg_salary
ORDER BY department_name, employees.salary DESC;


-- Task 4
SELECT
  customers.city,
  COUNT(*) AS gold_customers
FROM customers
WHERE customers.loyalty_level = 'Gold'
GROUP BY customers.city
ORDER BY gold_customers DESC, customers.city;