-- Inserting data
INSERT INTO contacts (name, email, phone) VALUES
('Alice', 'alice@gmail.com', '111-1111'),
('Bob', 'bob@gmail.com', '222-2222'),
('Charlie', 'charlie@gmail.com', '333-3333'),
('Diana', 'diana@gmail.com', '444-4444'),
('Edward', 'edward@qq.com', '555-5555');

-- Update contact
UPDATE contacts SET phone = '999-0000' WHERE name = 'Charlie';

-- Delete contact
DELETE FROM contacts WHERE name = 'Edward';

-- Select contacts with gmail
SELECT * FROM contacts WHERE email LIKE '%gmail.com%';

-- View all contacts ordered by creation time
SELECT * FROM contacts ORDER BY created_at DESC;