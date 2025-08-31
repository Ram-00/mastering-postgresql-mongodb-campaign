SET search_path TO week2, public;

-- India-themed sample data
INSERT INTO v4_customers (full_name, email, active) VALUES
('Arjun Mehta',  'arjun.mehta@gmail.com',  true),
('Sneha Reddy',  'sneha.reddy@gmail.com',  true),
('Vikram Iyer',  'vikram.iyer@gmail.com',  false);

INSERT INTO v4_orders (v4_customer_id, order_date, total) VALUES
(1, '2025-08-01 09:15:00',  1799.00),
(1, '2025-08-10 19:45:00',  3299.50),
(2, '2025-08-05 15:20:00',  1199.75);

INSERT INTO v4_order_items (v4_order_id, product_name, quantity, unit_price) VALUES
(1, 'Boat Airdopes 141',          1, 1499.00),
(1, 'USB-C Cable (1.5m)',         2, 150.00),
(2, 'Mi Power Bank 10000mAh',     1, 1799.50),
(3, 'Prestige Kettle 1.5L',       1, 1199.75);
