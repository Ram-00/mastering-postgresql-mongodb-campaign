# Day 5 Notes: PostgreSQL Data Types & Constraints

## Data Types
- `INTEGER` / `SERIAL`: Numbers and auto-incremented IDs.
- `VARCHAR(n)` / `TEXT`: Strings and long-form text.
- `BOOLEAN`: TRUE/FALSE.
- `DATE`, `TIMESTAMP`: Dates and date-times.
- `NUMERIC(p,s)`: High-precision decimals.

## Constraints
- `PRIMARY KEY`: Unique row identifier.
- `NOT NULL`: Value must be provided.
- `UNIQUE`: No duplicate values allowed.
- `DEFAULT`: Auto-fill if value not given.
- `CHECK`: Must satisfy custom condition.

**Example Table:**
```
CREATE TABLE tasks (

task_id SERIAL PRIMARY KEY,

description TEXT NOT NULL,

status VARCHAR(12) NOT NULL DEFAULT 'pending',

due_date DATE,

priority INTEGER CHECK (priority BETWEEN 1 AND 5),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
```
**Links:**  
- [PostgreSQL Data Types](https://www.postgresql.org/docs/current/datatype.html)
- [PostgreSQL Constraints](https://www.postgresql.org/docs/current/ddl-constraints.html)
