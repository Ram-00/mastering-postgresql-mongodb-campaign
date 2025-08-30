# Week 2, Day 3: Indexing and Query Performance

Optimize common access patterns with the right indexes and verify improvements via EXPLAIN ANALYZE.

## Files
- `schema.sql` — Tables plus a variety of indexes (multicolumn, partial, INCLUDE, functional, GIN, BRIN).
- `seed.sql` — Sample data and ANALYZE for realistic plans.
- `queries.sql` — Benchmark queries with EXPLAIN ANALYZE to see planner choices.
- `notes.md` — Concepts, patterns, and guidance for reading plans.
- `practice-notes.md` — Experiment outcomes and observations.
- `reflection.md` — Lessons learned and next steps.

## How to Run
1. Ensure database: `week2_testdb`
2. Execute:
```
\i schema.sql

\i seed.sql

\i queries.sql
```
3. Compare EXPLAIN ANALYZE output before/after toggling indexes (comment out CREATE INDEX lines and DROP INDEX to experiment).

## Verification Checklist
- [ ] Recent-order queries use the multicolumn index.
- [ ] Pending-order queries use the partial index.
- [ ] Case-insensitive email/name searches hit functional indexes.
- [ ] Product listing query performs index-only scan when possible.
- [ ] JSONB containment uses GIN.
- [ ] BRIN helps time-window scans on larger tables.

## Tips
- Keep search_path set to `week2, public` if running files individually.
- Avoid redundant indexes; measure write overhead in real workloads.