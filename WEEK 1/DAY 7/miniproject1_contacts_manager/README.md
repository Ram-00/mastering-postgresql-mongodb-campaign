# Mini-Project 1: Personal Contacts Manager

## Requirements
- Schema: `contacts(id, name, email, phone, created_at)`
- Constraints: `id` SERIAL PRIMARY KEY, `name` NOT NULL, `email` UNIQUE

## Schema
```
CREATE TABLE contacts (

id SERIAL PRIMARY KEY,

name VARCHAR(50) NOT NULL,

email VARCHAR(100) UNIQUE,

phone VARCHAR(15),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
```
`## Sample Insertions`
```
INSERT INTO contacts (name, email, phone) VALUES

('Ram charan', '[ram.charan@gmail.com](mailto:ram.charan@gmail.com)', '5551234567'),

('Arjun kumar', '[arjun.kumar@yahoo.com](mailto:arjun.kumar@yahoo.com)', '5556543210');
```

`## Listing Contacts`
```
SELECT * FROM contacts;
```

## Update/Remove Example`
```
UPDATE contacts SET phone = '5559876543' WHERE name = 'Arjun kumar';

DELETE FROM contacts WHERE email = '[arjun.kumar@yahoo.com](mailto:arjun.kumar@yahoo.com)';
```
## Output
- Records correctly added, updated, and removed.
- Table lists current contacts.
