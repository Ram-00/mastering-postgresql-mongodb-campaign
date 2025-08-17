SET search_path TO week2, public;

-- Users
INSERT INTO c_users (email, full_name) VALUES
('admin@email.com', 'Admin User'),
('manager@email.com', 'Manager User');

-- Customers
INSERT INTO c_customers (email, full_name) VALUES
('mahendra@email.com', 'Mahendra'),
('suresh@email.com', 'Suresh');

-- Addresses
INSERT INTO c_addresses (c_customer_id, line1, city, state, postal_code, is_default) VALUES
(1, '123 Main St', 'Portland', 'OR', '97201', true),
(1, '456 Oak Ave', 'Portland', 'OR', '97202', false),
(2, '789 Pine Rd', 'Seattle', 'WA', '98101', true);

-- Items
INSERT INTO c_items (sku, item_name, list_price, sale_price) VALUES
('ITM-LAPTOP-001', 'Gaming Laptop', 1299.99, NULL),
('ITM-MOUSE-001', 'Wireless Mouse', 29.99, 24.99),
('ITM-BOOK-001', 'SQL Fundamentals', 39.95, 29.95);

-- Orders
INSERT INTO c_orders (c_customer_id, status) VALUES
(1, 'COMPLETED'),
(2, 'PENDING');

-- Order Lines
INSERT INTO c_order_lines (c_order_id, c_item_id, qty, unit_price) VALUES
(1, 1, 1, 1299.99),
(1, 2, 2, 24.99),
(2, 3, 1, 39.95);

-- Promotions
INSERT INTO c_promotions (name, starts_at, ends_at, discount_pct) VALUES
('Summer Sale', DATE '2025-08-01', DATE '2025-08-31', 10.00),
('Back to School', DATE '2025-08-10', DATE '2025-09-05', 15.00);

-- Payment Methods
INSERT INTO c_payment_methods (c_customer_id, brand, last4, is_primary) VALUES
(1, 'VISA', '1234', true),
(1, 'MASTERCARD', '8888', false),
(2, 'AMEX', '7777', true);

-- Room bookings (non-overlapping for same room)
INSERT INTO c_room_bookings (room_id, period, booked_by) VALUES
(101, tsrange(TIMESTAMP '2025-08-11 09:00', TIMESTAMP '2025-08-11 11:00', '[)'), 2),
(101, tsrange(TIMESTAMP '2025-08-11 11:00', TIMESTAMP '2025-08-11 12:00', '[)'), 3);

-- Partners (circular reference via deferred constraint)
BEGIN;
INSERT INTO c_partners (name) VALUES ('Alpha');  -- id 1
INSERT INTO c_partners (name) VALUES ('Beta');   -- id 2
SET CONSTRAINTS ALL DEFERRED;
UPDATE c_partners SET preferred_partner_id = 2 WHERE c_partner_id = 1;
UPDATE c_partners SET preferred_partner_id = 1 WHERE c_partner_id = 2;
COMMIT;
