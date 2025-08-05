-- Create Database
CREATE DATABASE week1_testdb;

-- List Databases
\l

-- Create Role
CREATE ROLE testuser WITH LOGIN PASSWORD 'securepass';

-- Grant Privileges
GRANT ALL PRIVILEGES ON DATABASE week1_testdb TO testuser;

-- Connect as testuser (run in terminal: psql -U testuser -d week1_testdb)
\dt  -- Expected: No relations found.