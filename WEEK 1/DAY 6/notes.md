# Day 6 Notes: Practical Refresher on Tables and CRUD

## Key Concepts Reviewed
- Table structure: Columns with data types (e.g., SERIAL, VARCHAR, NUMERIC, DATE, BOOLEAN).
- Constraints: PRIMARY KEY, NOT NULL, UNIQUE, CHECK, DEFAULT.
- CRUD: INSERT for creation, SELECT for reading (with WHERE, ORDER BY), UPDATE for modification, DELETE for removal.

## Best Practices
- Always specify WHERE in UPDATE/DELETE to avoid mass changes.
- Use constraints to enforce business rules (e.g., salary > 0).
- Test invalid data to understand error handling.

**Links:**  
- [PostgreSQL CRUD Tutorial](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-insert/)  
- [Error Codes Reference](https://www.postgresql.org/docs/current/errcodes-appendix.html)
