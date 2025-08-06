# Day 3 Practice Notes

## Created Table:
- `students` with serial primary key, names, unique email, not-null enrollment date

## Inserted Data:
- 3 dummy students: Alice, Bob, Charlie

## Queries:
- List all students: `SELECT * FROM students;`
- List students enrolled after 2024-09-01: `SELECT * FROM students WHERE enrollment_date > '2024-09-01';`

## Experiment with Constraints:
- Tried inserting a row with a duplicate email:
  - Error: `ERROR:  duplicate key value violates unique constraint "students_email_key"`
- Reflection: UNIQUE constraints are enforced automatically to maintain data integrity.

---

**Learning:** Creating and populating tables is a core SQL skill. Using primary keys and constraints ensures data is reliable and errors are caught early.