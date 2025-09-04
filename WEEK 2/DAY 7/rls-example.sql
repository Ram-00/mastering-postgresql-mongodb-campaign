-- Enable RLS on orders table
ALTER TABLE week2.orders ENABLE ROW LEVEL SECURITY;

-- Create RLS policy allowing users to see only their orders-- Assuming user_name maps to customer_id for demo purposes
CREATE POLICY user_orders_select ON week2.orders
  FOR SELECT
  TO arun, varun
  USING (customer_id = current_setting('app.current_customer_id')::int);

-- To simulate per-user access, set parameter in sessions:-- SET app.current_customer_id = '1';-- Then WHOLE SELECT statements respect policies-- Example: attempt to select orders (will filter rows accordingly)
SELECT * FROM week2.orders;