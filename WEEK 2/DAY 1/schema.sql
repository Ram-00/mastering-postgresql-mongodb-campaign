-- Connect to week2_testdb and create schema
\c week2_testdb;
CREATE SCHEMA IF NOT EXISTS week2;
SET search_path TO week2, public;

-- Customers table (1NF, 2NF, 3NF compliant)
CREATE TABLE customers (
  customer_id BIGSERIAL PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  full_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Addresses table (1:N with customers)
CREATE TABLE addresses (
  address_id BIGSERIAL PRIMARY KEY,
  customer_id BIGINT NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
  line1 TEXT NOT NULL,
  line2 TEXT,
  city TEXT NOT NULL,
  state TEXT,
  postal_code TEXT,
  country TEXT NOT NULL DEFAULT 'USA',
  is_default BOOLEAN NOT NULL DEFAULT false
);

-- Categories table
CREATE TABLE categories (
  category_id BIGSERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  description TEXT
);

-- Products table
CREATE TABLE products (
  product_id BIGSERIAL PRIMARY KEY,
  sku TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  price NUMERIC(12,2) NOT NULL CHECK (price >= 0),
  description TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Product-Categories junction table (M:N)
CREATE TABLE product_categories (
  product_id BIGINT NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
  category_id BIGINT NOT NULL REFERENCES categories(category_id) ON DELETE CASCADE,
  PRIMARY KEY (product_id, category_id)
);

-- Inventory table (1:1 with products)
CREATE TABLE inventory (
  product_id BIGINT PRIMARY KEY REFERENCES products(product_id) ON DELETE CASCADE,
  quantity_on_hand INTEGER NOT NULL DEFAULT 0 CHECK (quantity_on_hand >= 0),
  reorder_level INTEGER NOT NULL DEFAULT 10
);

-- Orders table (1:N with customers)
CREATE TABLE orders (
  order_id BIGSERIAL PRIMARY KEY,
  customer_id BIGINT NOT NULL REFERENCES customers(customer_id),
  status TEXT NOT NULL DEFAULT 'PENDING',
  order_date TIMESTAMPTZ NOT NULL DEFAULT now(),
  shipping_address_id BIGINT REFERENCES addresses(address_id)
);

-- Order Items table (1:N with orders, N:1 with products)
CREATE TABLE order_items (
  order_id BIGINT NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
  product_id BIGINT NOT NULL REFERENCES products(product_id),
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
  PRIMARY KEY (order_id, product_id)
);