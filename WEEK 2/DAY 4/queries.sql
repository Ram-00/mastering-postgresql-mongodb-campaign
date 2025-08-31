-- Week 2 • Day 4 • queries.sql (final, idempotent up to Step 5 you completed)

SET search_path TO week2, public;

-- 1) View: active customers with latest order date
CREATE OR REPLACE VIEW v4_active_customers_latest_order AS
SELECT
  c.v4_customer_id,
  c.full_name,
  c.email,
  MAX(o.order_date) AS latest_order_date
FROM v4_customers c
LEFT JOIN v4_orders o
  ON o.v4_customer_id = c.v4_customer_id
WHERE c.active = TRUE
GROUP BY c.v4_customer_id, c.full_name, c.email;

-- Query the view
SELECT *
FROM v4_active_customers_latest_order
ORDER BY latest_order_date DESC NULLS LAST;


-- 2) Materialized view: monthly sales by product
-- Create empty MV once (fast, safe to re-run)
CREATE MATERIALIZED VIEW IF NOT EXISTS v4_monthly_sales_mv AS
SELECT
  date_trunc('month', o.order_date) AS month,
  oi.product_name,
  SUM(oi.quantity * oi.unit_price) AS total_sales
FROM v4_orders o
JOIN v4_order_items oi
  ON oi.v4_order_id = o.v4_order_id
GROUP BY month, oi.product_name
WITH NO DATA;

-- Required unique index for future CONCURRENTLY refreshes
CREATE UNIQUE INDEX IF NOT EXISTS ux_v4_monthly_sales_mv
  ON v4_monthly_sales_mv (month, product_name);

-- First-time population MUST be non-concurrent
-- (If you already ran this once, it will just refresh again.)
REFRESH MATERIALIZED VIEW v4_monthly_sales_mv;

-- Verify MV has rows
SELECT COUNT(*) AS mv_rows FROM v4_monthly_sales_mv;

-- From now on you can refresh concurrently (outside of a multi-statement transaction)
REFRESH MATERIALIZED VIEW CONCURRENTLY v4_monthly_sales_mv;

-- Query MV
SELECT *
FROM v4_monthly_sales_mv
ORDER BY month DESC, total_sales DESC;


-- 3) Function: return order details with line totals
CREATE OR REPLACE FUNCTION v4_get_order_details(p_order_id BIGINT)
RETURNS TABLE (
  product_name TEXT,
  quantity     INT,
  unit_price   NUMERIC,
  line_total   NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN QUERY
  SELECT
    oi.product_name  AS product_name,
    oi.quantity      AS quantity,
    oi.unit_price    AS unit_price,
    oi.quantity * oi.unit_price AS line_total
  FROM v4_order_items AS oi
  WHERE oi.v4_order_id = p_order_id;
END;
$$;

-- Example call
SELECT * FROM v4_get_order_details(1);


-- 4) Procedure: insert a new customer and return the new id (OUT parameter)
CREATE OR REPLACE PROCEDURE v4_add_customer(
  p_full_name TEXT,
  p_email TEXT,
  OUT p_new_customer_id BIGINT
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO v4_customers(full_name, email)
  VALUES (p_full_name, p_email)
  RETURNING v4_customer_id INTO p_new_customer_id;
END;
$$;

-- Example call (OUT param returned by CALL)
CALL v4_add_customer('Ritika Sharma', 'ritika.sharma@gmail.com', NULL);


-- 5) Function with exception handling for duplicate email
CREATE OR REPLACE FUNCTION v4_safe_add_customer(p_full_name TEXT, p_email TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO v4_customers(full_name, email)
  VALUES (p_full_name, p_email);
  RETURN 'Customer added';
EXCEPTION WHEN unique_violation THEN
  RETURN 'Email already exists';
END;
$$;

-- Example test (duplicate email case)
SELECT v4_safe_add_customer('Amit Shah', 'arjun.mehta@gmail.com');
