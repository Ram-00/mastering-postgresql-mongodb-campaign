# Week 2, Day 4: Views, Materialized Views & Stored Procedures

## Overview

This day covers creating reusable query abstractions with Views, boosting performance using Materialized Views, and encapsulating business logic using PL/pgSQL stored procedures and functions.

## Files

- `notes.md` — Concepts and best practices for Views, MVs, and Stored Procedures.
- `schema.sql` — Core table definitions to support demos.
- `seed.sql` — Sample data insertion.
- `queries.sql` — Views/MVs definitions and stored procedure/function implementations.
- `practice-notes.md` — Hands-on notes and test outcomes.
- `reflection.md` — Daily learning reflections.

## How to Run

1. Ensure you are connected to `week2_testdb`
2. Execute files in order:
```
\i schema.sql

\i seed.sql

\i queries.sql
```
text3. Use SELECTs and CALLs in `queries.sql` to verify outputs.

## Verification Checklist

- [ ] Views return expected up-to-date data.
- [ ] Materialized view refresh updates stored results.
- [ ] Stored functions return correct output tables.
- [ ] Stored procedures execute inserts with output parameters.
- [ ] Exception handling works as expected for duplicates.

## Tips

- Use `REFRESH MATERIALIZED VIEW CONCURRENTLY` to avoid locks in production.
- Document procedure/function parameters clearly.
- Apply security best practices when granting EXECUTE rights.

---
