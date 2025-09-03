# Day 5 Notes: Transactions, Locking, and Concurrency Control

## Transactions Basics
- Group multiple statements into atomic units with BEGIN/COMMIT/ROLLBACK.
- Maintain ACID properties for reliability.
  
## MVCC Model
- Versioning allows readers and writers without blocking.
- Each transaction gets a snapshot; changes are visible after commit.

## Isolation Levels
- READ COMMITTED (default): statement-level snapshot.
- REPEATABLE READ: transaction-level snapshot consistency.
- SERIALIZABLE: strictest; may abort conflicting transactions.

## Lock Types
- Row-level locks: SELECT FOR UPDATE/SHARE
- Table locks: explicit LOCK or implicit through DDL
- Advisory locks: application-managed, lightweight

## Deadlocks
- Circular waits detected by PostgreSQL.
- Aborts one transaction to resolve.
- Use consistent locking orders, NOWAIT or SKIP LOCKED to mitigate.

## Best Practices
- Keep transactions short.
- Use lowest suitable isolation level.
- Avoid unnecessary locking.
- Use advisory locks for advanced concurrency control.
