-- Set search path
SET search_path TO week2, public;

-- 1. Find customer by email
SELECT customer_id, full_name, email, created_at
FROM customers 
WHERE email = 'ravi@email.com';

-- 2. List all addresses for a customer
SELECT a.line1, a.line2, a.city, a.state, a.postal_code, a.is_default
FROM addresses a
JOIN customers c ON c.customer_id = a.customer_id
WHERE c.email = 'ravi@email.com';

-- 3. Products in Electronics category
SELECT p.sku, p.name, p.price
FROM products p
JOIN product_categories pc ON pc.product_id = p.product_id
JOIN categories c ON c.category_id = pc.category_id
WHERE c.name = 'Electronics';

-- 4. All categories for Gaming Laptop
SELECT c.name, c.description
FROM categories c
JOIN product_categories pc ON pc.category_id = c.category_id
JOIN products p ON p.product_id = pc.product_id
WHERE p.name = 'Gaming Laptop';

-- 5. Customer orders with items and totals
SELECT 
  c.full_name,
  o.order_id,
  o.status,
  o.order_date,
  p.name AS product_name,
  oi.quantity,
  oi.unit_price,
  (oi.quantity * oi.unit_price) AS line_total
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
WHERE c.email = 'ravi@email.com'
ORDER BY o.order_date DESC, p.name;

-- 6. Order totals by customer
SELECT 
  c.full_name,
  o.order_id,
  o.status,
  SUM(oi.quantity * oi.unit_price) AS order_total
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.customer_id, c.full_name, o.order_id, o.status
ORDER BY order_total DESC;

-- 7. Products low on inventory
SELECT 
  p.name,
  p.sku,
  i.quantity_on_hand,
  i.reorder_level
FROM products p
JOIN inventory i ON i.product_id = p.product_id
WHERE i.quantity_on_hand <= i.reorder_level;
