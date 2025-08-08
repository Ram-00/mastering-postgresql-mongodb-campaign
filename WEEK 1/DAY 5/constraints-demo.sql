-- Example Table
CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price NUMERIC(8,2) CHECK (price > 0),
	in_stock BOOLEAN DEFAULT TRUE
);

SELECT * FROM products;

-- Create the tasks table with multiple constraints
CREATE TABLE tasks (
	task_id SERIAL PRIMARY KEY,
	description TEXT NOT NULL,
	status VARCHAR(12) NOT NULL DEFAULT 'PENDING',
	due_date DATE,
	priority INTEGER CHECK (priority BETWEEN 1 AND 5),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM tasks;

-- Valid inserts
INSERT INTO tasks (description, status, due_date, priority)
VALUES
	('Prepare project outline', 'pending', '2024-10-01', 3),
	('Submit report', 'in-progress', '2024-10-10', 2),
	('Team meeting', 'completed', '2024-09-15', 4);

-- Invalid: Missing description (NOT NULL)
-- ERROR:  null value in column "description" of relation "tasks" violates not-null constraint.
INSERT INTO tasks (status, due_date, priority)
VALUES
	('pending', '2024-10-02', 2);

--Invalid: Priority out of range (CHECK)
INSERT INTO tasks (description, status, due_date, priority)
VALUES
	('Invalid priority test', 'pending', '2024-10-03', 7);