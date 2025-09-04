-- Run VACUUM FULL on large tables
VACUUM FULL week2.orders;
VACUUM FULL week2.order_items;

-- Run ANALYZE for query planner statistics
ANALYZE week2.orders;
ANALYZE week2.order_items;

-- Check size before and after
SELECT
  relname,
  pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
  n_dead_tup
FROM pg_stat_user_tables
WHERE schemaname = 'week2' AND relname IN ('orders', 'order_items');