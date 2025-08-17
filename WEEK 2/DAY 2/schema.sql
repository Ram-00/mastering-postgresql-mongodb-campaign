-- Connect and set context
\c week2_testdb;
CREATE SCHEMA IF NOT EXISTS week2;
SET search_path TO week2, public;

-- Extension for EXCLUDE with scalar operators
CREATE EXTENSION IF NOT EXISTS btree_gist;

-- 1) Users demo with email validation (domain-like via CHECK)
CREATE TABLE IF NOT EXISTS c_users (
  c_user_id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE CHECK (email ~* '^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$'),
  full_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- 2) Customers + addresses (constraints demo variants; not Week 1 tables)
CREATE TABLE IF NOT EXISTS c_customers (
  c_customer_id BIGSERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  full_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS c_addresses (
  c_address_id BIGSERIAL PRIMARY KEY,
  c_customer_id BIGINT NOT NULL REFERENCES c_customers(c_customer_id) ON DELETE CASCADE,
  line1 TEXT NOT NULL,
  line2 TEXT,
  city TEXT NOT NULL,
  state TEXT,
  postal_code TEXT,
  country TEXT NOT NULL DEFAULT 'INDIA',
  is_default BOOLEAN NOT NULL DEFAULT false
);

-- Only one default address per customer (partial unique)
CREATE UNIQUE INDEX IF NOT EXISTS ux_c_addresses_default_per_customer
  ON c_addresses(c_customer_id)
  WHERE is_default = true;

-- 3) Catalog + pricing constraints (separate from Week 1 products)
CREATE TABLE IF NOT EXISTS c_items (
  c_item_id BIGSERIAL PRIMARY KEY,
  sku TEXT NOT NULL UNIQUE,
  item_name TEXT NOT NULL,
  list_price NUMERIC(12,2) NOT NULL CHECK (list_price >= 0),
  sale_price NUMERIC(12,2),
  CHECK (sale_price IS NULL OR sale_price <= list_price)
);

-- 4) Orders demo with DEFERRABLE FK and generated column (not Week 1 orders)
CREATE TABLE IF NOT EXISTS c_orders (
  c_order_id BIGSERIAL PRIMARY KEY,
  c_customer_id BIGINT NOT NULL,
  status TEXT NOT NULL DEFAULT 'PENDING',
  placed_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  CONSTRAINT fk_c_orders_customer
    FOREIGN KEY (c_customer_id)
    REFERENCES c_customers(c_customer_id)
    ON DELETE RESTRICT
    DEFERRABLE INITIALLY IMMEDIATE
);

CREATE TABLE IF NOT EXISTS c_order_lines (
  c_order_id BIGINT NOT NULL,
  c_item_id BIGINT NOT NULL,
  qty INT NOT NULL CHECK (qty > 0),
  unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
  line_total NUMERIC(12,2) GENERATED ALWAYS AS (qty * unit_price) STORED,
  PRIMARY KEY (c_order_id, c_item_id),
  CONSTRAINT fk_c_ol_order
    FOREIGN KEY (c_order_id) REFERENCES c_orders(c_order_id) ON DELETE CASCADE,
  CONSTRAINT fk_c_ol_item
    FOREIGN KEY (c_item_id) REFERENCES c_items(c_item_id) ON DELETE RESTRICT
);

-- 5) Promotions with date/money checks
CREATE TABLE IF NOT EXISTS c_promotions (
  c_promo_id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  starts_at DATE NOT NULL,
  ends_at DATE NOT NULL,
  discount_pct NUMERIC(5,2) CHECK (discount_pct BETWEEN 0 AND 100),
  CHECK (starts_at <= ends_at)
);

-- 6) Room bookings using EXCLUDE to prevent period overlaps
CREATE TABLE IF NOT EXISTS c_room_bookings (
  c_booking_id BIGSERIAL PRIMARY KEY,
  room_id INT NOT NULL,
  period TSRANGE NOT NULL,
  booked_by BIGINT REFERENCES c_users(c_user_id) ON DELETE SET NULL,
  EXCLUDE USING gist (
    room_id WITH =,
    period WITH &&
  )
);

-- 7) Payment methods: only one primary per customer (partial unique)
CREATE TABLE IF NOT EXISTS c_payment_methods (
  c_payment_id BIGSERIAL PRIMARY KEY,
  c_customer_id BIGINT NOT NULL REFERENCES c_customers(c_customer_id) ON DELETE CASCADE,
  brand TEXT NOT NULL,               -- e.g., 'VISA'
  last4 CHAR(4) NOT NULL,
  is_primary BOOLEAN NOT NULL DEFAULT false,
  added_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE UNIQUE INDEX IF NOT EXISTS ux_c_primary_payment_per_customer
  ON c_payment_methods(c_customer_id)
  WHERE is_primary = true;

-- 8) Circular reference demo with DEFERRABLE FKs (partner -> preferred partner)
CREATE TABLE IF NOT EXISTS c_partners (
  c_partner_id BIGSERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  preferred_partner_id BIGINT,
  CONSTRAINT fk_c_partner_pref
    FOREIGN KEY (preferred_partner_id)
    REFERENCES c_partners(c_partner_id)
    DEFERRABLE INITIALLY DEFERRED
);
