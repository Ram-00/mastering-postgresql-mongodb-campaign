# Day 6 Practice Notes

- Created `employees` table with constraints.
- Inserted 3 valid employees.
- Queries returned expected results (e.g., high-salary employees).
- UPDATE and DELETE worked as intended.
- Error 1: Negative salary → "ERROR: new row for relation 'employees' violates check constraint 'employees_salary_check'".
- Error 2: Duplicate email → "ERROR: duplicate key value violates unique constraint 'employees_email_key'".
- Resolutions: Adjust values to meet constraints before inserting.

**Learning:** These exercises reinforced how constraints prevent bad data, a key skill for reliable apps.
