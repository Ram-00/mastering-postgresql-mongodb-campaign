# Day 3 Practice Notes

## Experiments
- Verified multicolumn index on (customer_id, placed_at DESC) improved recent-order queries.
- Partial index on PENDING significantly reduced scan time compared to full index.
- INCLUDE (sku, name) enabled index-only scans for product listings in many runs (VM visibility permitting).
- Functional index on lower(email) and lower(name) supported case-insensitive equality and prefix searches.
- GIN on JSONB sped up attributes @> queries vs Seq Scan.
- BRIN on orders helped with recent time-window queries on a larger dataset.

## Metrics Observed (qualitative)
- Seq Scan → Index/Bitmap switch for selective predicates.
- Lower total cost and actual time; fewer rows removed by Filter.
- Reduced Heap Fetches when index-only scan possible.

## Notes
- After bulk inserts, ANALYZE improved estimates markedly.
- Multicolumn order matters: placing customer_id first was critical.
- Too many indexes begin to slow INSERT/UPDATE; balance is required.