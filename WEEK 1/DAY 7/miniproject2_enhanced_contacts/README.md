# Mini-Project 2: Enhanced Contacts With Validation

## Requirements
- Use all Project 1 constraints.
- Add CHECK for phone numbers (must be 10 digits).
- Demonstrate errors: duplicate emails, invalid phone numbers.

## Schema
```
CREATE TABLE contacts_enhanced (

id SERIAL PRIMARY KEY,

name VARCHAR(50) NOT NULL,

email VARCHAR(100) UNIQUE NOT NULL,

phone VARCHAR(10) CHECK (char_length(phone) = 10),

created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
```

`## Valid Insert`
```
INSERT INTO contacts_enhanced (name, email, phone) VALUES

('Ramcharan', '[ramcharan@mail.com](mailto:ramcharan@mail.com)', '1234567890');
```

`## Invalid Inserts`

- - Duplicate email
```
INSERT INTO contacts_enhanced (name, email, phone) VALUES

('Arjun Kumar', '[ramcharan@mail.com](mailto:ramcharan@mail.com)', '0987654321');
```
-- Error: duplicate key value violates unique constraint "contacts_enhanced_email_key"


- - Invalid phone number
```
INSERT INTO contacts_enhanced (name, email, phone) VALUES

('Kiran kumar', '[kirankumar@mail.com](mailto:kirankumar@mail.com)', '555');
```

-- Error: new row for relation "contacts_enhanced" violates check constraint "contacts_enhanced_phone_check"

## Documentation
- Error messages captured and explained in `error-notes.md`.
- Importance of constraints and error handling highlighted.`

