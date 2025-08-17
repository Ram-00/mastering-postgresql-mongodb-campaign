# Week 2, Day 2: Constraints and Data Integrity

This module enforces business rules at the database layer using PostgreSQL constraints.

## Files
- `schema.sql` — All DDL for constraint demos (partial unique, EXCLUDE, DEFERRABLE).
- `seed.sql` — Sample data to validate behaviors.
- `queries.sql` — Tests and integrity reports.
- `notes.md` — Concepts, patterns, and gotchas.
- `practice-notes.md` — What was tested and observed.
- `reflection.md` — Personal reflections and takeaways.

## How to Run
1. Ensure database: `week2_testdb`
2. Execute:
```
\i schema.sql

\i seed.sql

\i queries.sql
```
3. Optional failure tests in `queries.sql` are commented; uncomment to observe constraint errors.

## Verification Checklist
- [ ] Duplicate defaults blocked per customer (addresses, payment methods).
- [ ] Negative prices or invalid sale prices rejected by CHECK.
- [ ] Orders can’t reference non-existent customers (FK enforced).
- [ ] Room bookings prevent overlaps for the same room (EXCLUDE).
- [ ] Generated `line_total` correctly reflects quantity*unit_price.
- [ ] DEFERRABLE behavior understood and demonstrated in a transaction.

## Notes
- Requires `btree_gist` for EXCLUDE on equality/comparison for scalars.
- Use `SET search_path TO week2, public;` if running files individually.