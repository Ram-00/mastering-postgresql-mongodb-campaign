-- Create a students table
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  enrollment_date DATE NOT NULL
);

-- Insert 3 rows
INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Alice', 'Johnson', 'alice.johnson@email.com', '2024-09-01'),
('Bob', 'Smith', 'bob.smith@email.com', '2024-09-02'),
('Charlie', 'Kim', 'charlie.kim@email.com', '2024-09-01');

-- View data
SELECT * FROM students;

-- Query for students enrolled after 2024-09-01
SELECT * FROM students WHERE enrollment_date > '2024-09-01';