# Day 5 Reflection

## Highlights
- Deepened understanding of MVCC and isolation levels effects.
- Gained hands-on experience with explicit locking and concurrency control.
- Learned practical deadlock troubleshooting and prevention.
- Understood effective patterns for concurrent job queues.

## Challenges
- Simulating deadlocks requires multiple sessions and coordination.
- Balancing data integrity and concurrency needs careful transaction design.

## Key Takeaways
- Use lowest isolation level that meets requirements to avoid unnecessary contention.
- Prefer short transactions holding minimal locks.
- Utilize PostgreSQL’s advanced features like SKIP LOCKED for real-world concurrency.

---

**Commit message:**
`feat: Week 2 Day 5 — transactions, locking, MVCC, and concurrency control demos`
