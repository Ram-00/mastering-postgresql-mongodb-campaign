SET search_path TO week2, public;

-- 1) Validate partial unique: attempt to add second primary payment for Alice (should fail)
-- Uncomment to test failure:
-- INSERT INTO c_payment_methods (c_customer_id, brand, last4, is_primary) VALUES (1, 'VISA', '9999', true);

-- 2) Verify generated column line_total
SELECT c_order_id, c_item_id, qty, unit_price, line_total
FROM c_order_lines
ORDER BY c_order_id, c_item_id;

-- 3) Check address default uniqueness per customer
SELECT c_customer_id, COUNT(*) FILTER (WHERE is_default) AS default_count
FROM c_addresses
GROUP BY c_customer_id;

-- 4) Validate CHECK and FK by trying invalid data (expect errors)
-- Uncomment to test:
-- INSERT INTO c_items (sku, item_name, list_price, sale_price) VALUES ('BAD-001', 'Bad', -10, NULL); -- list_price < 0 -> fail
-- INSERT INTO c_orders (c_customer_id, status) VALUES (999, 'PENDING'); -- missing FK -> fail

-- 5) EXCLUDE overlap test: should fail due to time overlap in same room
-- Uncomment to test failure:
-- INSERT INTO c_room_bookings (room_id, period, booked_by)
-- VALUES (101, tsrange(TIMESTAMP '2025-08-11 10:30', TIMESTAMP '2025-08-11 11:30', '[)'), 1);

-- 6) Deferring FK check example for c_orders.c_customer_id
BEGIN;
SET CONSTRAINTS fk_c_orders_customer DEFERRED;
-- Create a temp customer, reference it, then delete before commit to observe behavior
-- (In a client, capture returned id and use it below.)
WITH ins AS (
  INSERT INTO c_customers (email, full_name) VALUES ('temp@example.com', 'Temp User')
  RETURNING c_customer_id
)
INSERT INTO c_orders (c_customer_id, status)
SELECT c_customer_id, 'PENDING' FROM ins;
-- Optional: try to delete the temp customer before commit to see FK behavior
-- DELETE FROM c_customers WHERE c_customer_id = (SELECT c_customer_id FROM ins);
COMMIT;

-- 7) Integrity reports
-- a) Orders with totals
SELECT
  o.c_order_id,
  c.full_name,
  SUM(ol.line_total) AS order_total
FROM c_orders o
JOIN c_customers c ON c.c_customer_id = o.c_customer_id
JOIN c_order_lines ol ON ol.c_order_id = o.c_order_id
GROUP BY o.c_order_id, c.full_name
ORDER BY order_total DESC;

-- b) Items with sale price violations (should be none)
SELECT c_item_id, list_price, sale_price
FROM c_items
WHERE sale_price IS NOT NULL AND sale_price > list_price;

-- c) Room bookings per room with periods
SELECT room_id, period
FROM c_room_bookings
ORDER BY room_id, lower(period);
