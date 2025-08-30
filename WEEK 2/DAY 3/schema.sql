-- Connect and set context
\c week2_testdb;
CREATE SCHEMA IF NOT EXISTS week2;
SET search_path TO week2, public;

-- Customers (indexing demo)
CREATE TABLE IF NOT EXISTS ix_customers (
  ix_customer_id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Categories
CREATE TABLE IF NOT EXISTS ix_categories (
  ix_category_id BIGSERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

-- Products
CREATE TABLE IF NOT EXISTS ix_products (
  ix_product_id BIGSERIAL PRIMARY KEY,
  sku TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  price NUMERIC(12,2) NOT NULL,
  attributes JSONB NOT NULL DEFAULT '{}'::jsonb,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Product-Category junction (many-to-many)
CREATE TABLE IF NOT EXISTS ix_product_categories (
  ix_product_id BIGINT NOT NULL REFERENCES ix_products(ix_product_id) ON DELETE CASCADE,
  ix_category_id BIGINT NOT NULL REFERENCES ix_categories(ix_category_id) ON DELETE CASCADE,
  PRIMARY KEY (ix_product_id, ix_category_id)
);

-- Orders (index demo)
CREATE TABLE IF NOT EXISTS ix_orders (
  ix_order_id BIGSERIAL PRIMARY KEY,
  ix_customer_id BIGINT NOT NULL REFERENCES ix_customers(ix_customer_id),
  status TEXT NOT NULL DEFAULT 'PENDING',
  placed_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Order items
CREATE TABLE IF NOT EXISTS ix_order_items (
  ix_order_id BIGINT NOT NULL REFERENCES ix_orders(ix_order_id) ON DELETE CASCADE,
  ix_product_id BIGINT NOT NULL REFERENCES ix_products(ix_product_id),
  quantity INTEGER NOT NULL,
  unit_price NUMERIC(12,2) NOT NULL,
  PRIMARY KEY (ix_order_id, ix_product_id)
);

-- 1) Essential foreign key helper indexes
CREATE INDEX IF NOT EXISTS ix_orders_ix_customer_id ON ix_orders(ix_customer_id);
CREATE INDEX IF NOT EXISTS ix_order_items_ix_product_id ON ix_order_items(ix_product_id);

-- 2) Multicolumn index for common access pattern (customer recent orders)
CREATE INDEX IF NOT EXISTS ix_orders_ix_customer_placed ON ix_orders(ix_customer_id, placed_at DESC);

-- 3) Partial index: accelerate hot subset queries (pending orders)
CREATE INDEX IF NOT EXISTS ix_orders_pending ON ix_orders(placed_at DESC) WHERE status = 'PENDING';

-- 4) Functional index for case-insensitive email lookups
CREATE INDEX IF NOT EXISTS ix_customers_lower_email ON ix_customers((lower(email)));

-- 5) Covering index (INCLUDE) to enable index-only product price listings
CREATE INDEX IF NOT EXISTS ix_products_price ON ix_products(price) INCLUDE (sku, name);

-- 6) Expression index for name search by lower(name) prefix
CREATE INDEX IF NOT EXISTS ix_products_lower_name ON ix_products((lower(name)));

-- 7) JSONB GIN index for attributes containment queries
CREATE INDEX IF NOT EXISTS gin_ix_products_attributes ON ix_products USING gin (attributes jsonb_path_ops);

-- 8) BRIN index example for time-ordered big tables (orders by placed_at)
CREATE INDEX IF NOT EXISTS brin_ix_orders_placed_at ON ix_orders USING brin (placed_at);

-- 9) Category/product join support
CREATE INDEX IF NOT EXISTS ix_product_categories_ix_category ON ix_product_categories(ix_category_id);
