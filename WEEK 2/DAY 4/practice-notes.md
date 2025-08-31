# Day 4 Practice Notes

## Views and Materialized Views
- Created view for active customers with latest order date.
- Created materialized view for monthly sales grouped by product.
- Verified manual refresh updated materialized view results.

## Stored Procedures and Functions
- Implemented a function returning order details with calculated line totals.
- Created a stored procedure for inserting customers with output parameter.
- Added exception-handling function for duplicate email insert to return friendly messages.

## Challenges
- Remembering difference between functions and procedures in invocation.
- Managing materialized view refresh concurrency considerations.
- Writing clean control flow and exception blocks in PL/pgSQL.

---

**Learnings**
- Views simplify complex queries for repeated use.
- Materialized views trade real-time freshness for performance.
- PL/pgSQL adds powerful procedural capabilities inside PostgreSQL.