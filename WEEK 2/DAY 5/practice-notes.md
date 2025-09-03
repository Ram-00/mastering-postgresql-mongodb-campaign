# Day 5 Practice Notes

## Experiments
- Created transfer funds transaction using explicit locking and rollback.
- Verified PostgreSQL’s prevention of dirty reads using default isolation.
- Observed consistent snapshot behavior under REPEATABLE READ.
- Tested SELECT FOR UPDATE to serialize data modifications.
- Simulated deadlock with two sessions and confirmed automatic detection.
- Implemented SKIP LOCKED for safe concurrent job processing.

## Observations
- Short transactions minimize lock contention.
- Deadlocks are avoidable with ordered locking discipline.
- SKIP LOCKED is powerful for concurrent queue processing.
- PostgreSQL’s MVCC ensures high concurrency with consistency.
