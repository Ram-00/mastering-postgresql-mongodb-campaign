-- Set search path
SET search_path TO week2, public;

-- Insert sample customers
INSERT INTO customers (email, full_name) VALUES 
('ravi@email.com', 'Ravi kumar'),
('arun@email.com', 'Arun vijay'),
('vani@email.com', 'Vani priya');

-- Insert addresses
INSERT INTO addresses (customer_id, line1, city, state, postal_code, is_default) VALUES 
(1, 'ABC St', 'Tirupati', 'AP', '12345', true),
(1, 'DEF St', 'Tirupati', 'AP', '23456', false),
(2, '123 St', 'Vijayawada', 'AP', '54321', true),
(3, 'XYZ St', 'Vizag', 'AP', '65432', true);

-- Insert categories
INSERT INTO categories (name, description) VALUES 
('Electronics', 'Electronic devices and accessories'),
('Books', 'Physical and digital books'),
('Clothing', 'Apparel and accessories'),
('Home & Garden', 'Items for home and outdoor use');

-- Insert products
INSERT INTO products (sku, name, price, description) VALUES 
('LAPTOP001', 'Gaming Laptop', 60000.99, 'High-performance gaming laptop'),
('MOUSE001', 'Wireless Mouse', 500.99, 'Ergonomic wireless mouse'),
('BOOK001', 'SQL Fundamentals', 300, 'Comprehensive SQL guide'),
('SHIRT001', 'Cotton T-Shirt', 400, '100% cotton t-shirt'),
('PLANT001', 'Peace Lily', 150, 'Low-maintenance houseplant');

-- Insert product-category relationships (M:N)
INSERT INTO product_categories (product_id, category_id) VALUES 
(1, 1), -- Laptop -> Electronics
(2, 1), -- Mouse -> Electronics  
(3, 2), -- Book -> Books
(4, 3), -- Shirt -> Clothing
(5, 4), -- Plant -> Home & Garden
(1, 4); -- Laptop also in Home & Garden (for home office)-- Insert inventory
INSERT INTO inventory (product_id, quantity_on_hand, reorder_level) VALUES 
(1, 15, 5),
(2, 50, 10),
(3, 25, 5),
(4, 100, 20),
(5, 8, 3);

-- Insert sample orders
INSERT INTO orders (customer_id, status, shipping_address_id) VALUES 
(1, 'COMPLETED', 1),
(2, 'PENDING', 3),
(3, 'SHIPPED', 4);

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES 
(1, 1, 1, 60000.99),
(1, 2, 2, 500.99),
(2, 3, 1, 300),
(2, 4, 3, 400),
(3, 5, 2, 150);
