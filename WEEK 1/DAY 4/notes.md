text# Day 4 Notes: SQL CRUD Operations

## INSERT
- Adds new records:
```
INSERT INTO contacts (name, email, phone) VALUES ('Eve Adams', 'eve.adams@gmail.com', '555-4321');
```
## SELECT
- Retrieves data:

```
SELECT * FROM contacts;

SELECT name, email FROM contacts WHERE email LIKE '%gmail.com%';

SELECT * FROM contacts ORDER BY created_at DESC;
```
## UPDATE
- Modifies data:

```
UPDATE contacts SET phone = '555-0000' WHERE name = 'Eve Adams';
```
## DELETE
- Removes data:
```
DELETE FROM contacts WHERE name = 'Eve Adams';
```

**Common Mistake:**  
Omitting the WHERE clause in UPDATE or DELETE will modify **all rows**!

**Links:**  
- [W3Schools - SQL CRUD](https://www.w3schools.com/sql/sql_crud.asp)
- [PostgreSQL SELECT Docs](https://www.postgresql.org/docs/current/tutorial-select.html)
