# Week 2, Day 5: Transactions, Locking & Concurrency Control

## Overview

This day covers PostgreSQL’s transaction handling model, various lock types, MVCC, isolation levels, and practical concurrency control techniques, including deadlock management and concurrent job processing.

## Files

- `schema.sql` — Accounts and transaction log tables to demo concurrency.
- `seed.sql` — Insert sample accounts with balances.
- `queries.sql` — Atomic transfer, REPEATABLE READ tests, lock demos, deadlock simulation, SKIP LOCKED example.
- `notes.md` — Concepts and theory of transactions and locking.
- `practice-notes.md` — Outcomes and key observations.
- `reflection.md` — Self-assessment and next steps.

## How to Run

1. Connect to `week2_testdb`.
2. Run:
```
\i schema.sql

\i seed.sql

\i queries.sql
```
3. Use multiple sessions to try concurrency and locking scenarios.

## Verification Checklist

- [ ] Atomic fund transfers rollback on errors.
- [ ] Dirty reads prevented at default isolation.
- [ ] REPEATABLE READ ensures snapshot consistency.
- [ ] Row-level locks serialize conflicting updates.
- [ ] Deadlocks detected and one transaction aborted.
- [ ] SKIP LOCKED enables concurrent job processing safely.

## Tips

- Keep transactions short to minimize contention.
- Use consistent lock acquisition order.
- Use advisory locks for complex application logic.

---
