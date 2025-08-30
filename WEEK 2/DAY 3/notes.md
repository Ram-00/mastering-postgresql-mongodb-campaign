# Day 3 Notes: Indexing, EXPLAIN, and Performance

## Index Types
- B-tree: equality, range, sort, join — default choice.
- Hash: equality-only; niche use cases.
- GiST: ranges, geometric, KNN — enables EXCLUDE, range operators.
- GIN: full-text, JSONB @>, arrays; great for containment/membership.
- BRIN: gigantic, append-only/time-ordered tables; block summaries.

## Core Patterns
- Multicolumn order matters: most selective first.
- Covering index with INCLUDE to enable index-only scans.
- Partial index for hot subsets (status='PENDING', deleted_at IS NULL).
- Functional/expression index to match computed WHERE predicates.
- Always index foreign key columns used in joins and deletes.

## EXPLAIN/ANALYZE Tips
- Look for switch from Seq Scan to Index Scan/Bitmap.
- Compare planned vs actual rows; large mismatch suggests stats issues.
- Many Heap Fetches? Consider index-only scan via INCLUDE or widen index.
- Use ANALYZE after bulk loads; increase column statistics for skew.

## Hygiene
- Too many indexes slow writes; drop unused ones.
- Avoid leading wildcard LIKE; consider full-text or trigram indexes.
- Verify with EXPLAIN ANALYZE; measure, don’t guess.
