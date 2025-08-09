-- Create employees table
CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  salary NUMERIC(10,2) CHECK (salary > 0),
  join_date DATE NOT NULL,
  is_active BOOLEAN DEFAULT TRUE
);

-- INSERT 3 employees
INSERT INTO employees (full_name, email, salary, join_date)
VALUES
  ('Vijay kumar', 'vijay.kumar@email.com', 55000.00, '2024-02-10'),
  ('Venkat Sai', 'venkat.sai@email.com', 62000.00, '2024-03-15'),
  ('Raghu varan', 'raghu.varan@email.com', 48000.00, '2024-01-20');

-- Query: Salary > 50000
SELECT * FROM employees WHERE salary > 50000;

-- Query: Joined after 2024-01-01, ordered by join_date DESC
SELECT * FROM employees WHERE join_date > '2024-01-01' ORDER BY join_date DESC;

-- UPDATE: Change salary and set inactive
UPDATE employees SET salary = 50000.00, is_active = FALSE WHERE email = 'raghu.varan@email.com';

-- DELETE: Remove by email
DELETE FROM employees WHERE email = 'venkat.sai@email.com';

-- Invalid INSERT: Salary <= 0
INSERT INTO employees (full_name, email, salary, join_date) VALUES ('Invalid User', 'invalid@email.com', -100.00, '2024-04-01');

-- Invalid INSERT: Duplicate email
INSERT INTO employees (full_name, email, salary, join_date) VALUES ('Duplicate User', 'duplicate.user@email.com', 50000.00, '2024-04-01');