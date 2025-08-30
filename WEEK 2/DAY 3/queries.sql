SET search_path TO week2, public;

-- 1) Customer recent orders
EXPLAIN ANALYZE
SELECT ix_order_id, placed_at, status
FROM ix_orders
WHERE ix_customer_id = (SELECT ix_customer_id FROM ix_customers WHERE email = 'arun.kumar@gmail.com')
ORDER BY placed_at DESC
LIMIT 10;

-- 2) Pending orders by recency
EXPLAIN ANALYZE
SELECT ix_order_id, placed_at
FROM ix_orders
WHERE status = 'PENDING'
ORDER BY placed_at DESC
LIMIT 20;

-- 3) Case-insensitive email lookup
EXPLAIN ANALYZE
SELECT ix_customer_id, email
FROM ix_customers
WHERE lower(email) = lower('ARUN.KUMAR@gmail.com');

-- 4) Product listing by price with covering index
EXPLAIN ANALYZE
SELECT sku, name, price
FROM ix_products
WHERE price BETWEEN 500 AND 20000
ORDER BY price
LIMIT 20;

-- 5) Name prefix search using functional index
EXPLAIN ANALYZE
SELECT ix_product_id, name
FROM ix_products
WHERE lower(name) LIKE 'po%'; -- to match "Polo Cotton T-Shirt"

-- 6) Products with JSONB attribute filter using GIN
EXPLAIN ANALYZE
SELECT sku, name
FROM ix_products
WHERE attributes @> '{"color":"black"}';

-- 7) Category join: verify indexes help join paths
EXPLAIN ANALYZE
SELECT p.sku, p.name, c.name AS category
FROM ix_products p
JOIN ix_product_categories pc ON pc.ix_product_id = p.ix_product_id
JOIN ix_categories c ON c.ix_category_id = pc.ix_category_id
WHERE c.name IN ('Electronics','Books');

-- 8) Time-window query leveraging BRIN on orders
EXPLAIN ANALYZE
SELECT ix_order_id, ix_customer_id, placed_at
FROM ix_orders
WHERE placed_at >= now() - interval '8 days';

-- 9) Stats tuning example for skewed column (demonstration)
-- ALTER TABLE ix_orders ALTER COLUMN status SET STATISTICS 200;
-- ANALYZE ix_orders;
