SET search_path TO week2, public;

-- Customers
INSERT INTO ix_customers (email, full_name) VALUES
('arun.kumar@gmail.com','Arun Kumar'),
('sneha.patil@gmail.com','Sneha Patil'),
('rajiv.singh@gmail.com','Rajiv Singh'),
('priya.sharma@gmail.com','Priya Sharma'),
('lata.joshi@gmail.com','Lata Joshi')
ON CONFLICT (email) DO NOTHING;

-- Categories
INSERT INTO ix_categories (name) VALUES
('Electronics'), ('Books'), ('Clothing'), ('Home & Kitchen')
ON CONFLICT (name) DO NOTHING;

-- Products
INSERT INTO ix_products (sku, name, price, attributes) VALUES
('MOBILE001', 'Redmi Note', 14999.00, '{"brand":"Xiaomi","ram":4,"color":"blue"}'),
('BOOK002', 'Data Structures in C', 550.00, '{"author":"Amit Kumar","language":"English"}'),
('TSHIRT005', 'Polo Cotton T-Shirt', 699.00, '{"size":"L","color":"green"}'),
('COOKER009', 'Prestige Pressure Cooker', 2050.00, '{"capacity":"3L","material":"aluminium"}'),
('BAG010', 'Wildcraft Backpack', 1599.00, '{"color":"black","capacity":"35L"}')
ON CONFLICT (sku) DO NOTHING;

-- Product categories
INSERT INTO ix_product_categories (ix_product_id, ix_category_id)
SELECT p.ix_product_id, c.ix_category_id
FROM (VALUES
  ('MOBILE001','Electronics'),
  ('BOOK002','Books'),
  ('TSHIRT005','Clothing'),
  ('COOKER009','Home & Kitchen'),
  ('BAG010','Clothing')
) x(sku, cat)
JOIN ix_products p ON p.sku = x.sku
JOIN ix_categories c ON c.name = x.cat
ON CONFLICT DO NOTHING;

-- Orders (sample generated rows: mix of statuses and days)
INSERT INTO ix_orders (ix_customer_id, status, placed_at)
SELECT c.ix_customer_id, s, now() - (g || ' days')::interval
FROM ix_customers c
JOIN LATERAL (VALUES ('PENDING'), ('COMPLETED'), ('SHIPPED')) s(status) ON true
JOIN LATERAL (VALUES (1),(4),(7),(10)) g(g) ON true
WHERE c.email IN ('arun.kumar@gmail.com','sneha.patil@gmail.com');

-- Order items sampled
INSERT INTO ix_order_items (ix_order_id, ix_product_id, quantity, unit_price)
SELECT o.ix_order_id, p.ix_product_id, (random()*2)::int + 1, p.price
FROM ix_orders o
JOIN LATERAL (SELECT ix_product_id, price FROM ix_products ORDER BY random() LIMIT 2) p ON true
ON CONFLICT DO NOTHING;

-- Refresh statistics for better query plans
ANALYZE;
