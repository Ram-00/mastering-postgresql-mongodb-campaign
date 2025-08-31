# Day 4 Notes: Views, Materialized Views, and Stored Procedures

## Views
- Virtual tables defined by queries.
- Simplify repeated complex queries.
- Always reflect real-time data.
- Updates require triggers or rules.

## Materialized Views
- Physical storage of query results.
- Faster for expensive queries.
- Require manual or scheduled refresh.
- Support CONCURRENTLY refresh with unique index.

## Stored Functions and Procedures
- Functions return values, called inside SQL.
- Procedures execute commands, called with CALL statement.
- PL/pgSQL provides control structures (IF, LOOP, etc.).
- Exception handling via EXCEPTION block.
- Dynamic SQL via EXECUTE.
- Input/Output parameters for flexibility.

## Best Practices
- Use Views for abstraction, materialized views for performance.
- Document refresh strategies for MVs.
- Encapsulate business logic in reusable PL/pgSQL functions.
- Avoid SQL injection by validating inputs.

## References
- PostgreSQL Views: https://www.postgresql.org/docs/current/views.html
- Materialized Views: https://www.postgresql.org/docs/current/rules-materializedviews.html
- PL/pgSQL: https://www.postgresql.org/docs/current/plpgsql.html