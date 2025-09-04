-- Connect and set schema
\c week2_testdb;

-- Create roles (groups)
CREATE ROLE reporting NOLOGIN;
CREATE ROLE developer NOLOGIN;

-- Create users
CREATE ROLE arun LOGIN PASSWORD 'arunpass' CONNECTION LIMIT 5;
CREATE ROLE varun LOGIN PASSWORD 'varunpass';

-- Grant group roles
GRANT reporting TO arun;
GRANT developer TO varun;

-- Grant privileges
GRANT CONNECT ON DATABASE week2_testdb TO reporting, developer;
GRANT USAGE ON SCHEMA week2 TO reporting, developer;
GRANT SELECT ON ALL TABLES IN SCHEMA week2 TO reporting;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA week2 TO developer;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA week2 GRANT SELECT ON TABLES TO reporting;
ALTER DEFAULT PRIVILEGES IN SCHEMA week2 GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO developer;

-- Revoke example: revoke all on a table from a user
REVOKE ALL ON TABLE week2.orders FROM varun;