\c week2_testdb;
CREATE SCHEMA IF NOT EXISTS week2;
SET search_path TO week2, public;

-- Day 4 isolated base tables (prefix v4_ to avoid collisions)

CREATE TABLE IF NOT EXISTS v4_customers (
  v4_customer_id BIGSERIAL PRIMARY KEY,
  full_name TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL,
  active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS v4_orders (
  v4_order_id BIGSERIAL PRIMARY KEY,
  v4_customer_id BIGINT NOT NULL REFERENCES v4_customers(v4_customer_id) ON DELETE CASCADE,
  order_date TIMESTAMPTZ NOT NULL DEFAULT now(),
  total NUMERIC(12,2) NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS v4_order_items (
  v4_order_item_id BIGSERIAL PRIMARY KEY,
  v4_order_id BIGINT NOT NULL REFERENCES v4_orders(v4_order_id) ON DELETE CASCADE,
  product_name TEXT NOT NULL,
  quantity INTEGER NOT NULL CHECK (quantity > 0),
  unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0)
);
