# Day 3 Notes: Tables, Columns, and Rows in PostgreSQL

## What is a Table?
A table organizes data into rows (records) and columns (fields). Each table is designed for a single entity type, e.g., users or orders.

## Columns and Data Types
- Integers, Strings (VARCHAR), Dates, Timestamps, Booleans, Serial (auto numbers)
- Constraints (e.g., `NOT NULL`, `PRIMARY KEY`, `UNIQUE`) ensure data integrity

## Creating Tables
```
CREATE TABLE contacts (
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE,
phone VARCHAR(15),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
## Viewing Tables
- List all tables: `\dt`
- Show table structure: `\d contacts`
- Select all rows: `SELECT * FROM contacts;`

**Links:**  
- [PostgreSQL Data Types](https://www.postgresql.org/docs/current/datatype.html)
- [CREATE TABLE Docs](https://www.postgresql.org/docs/current/tutorial-inheritance.html)
