# Day 2 Notes: PostgreSQL Installation & Tools

## Installation Steps
- **Windows:** Download installer from official site; follow wizard.
- **macOS:** `brew install postgresql` via Homebrew.
- **Linux:** `sudo apt install postgresql`.
- Verify: `psql --version`.

## psql (CLI)
- Connect: `psql -U postgres`.
- Commands: `\l` (list DBs), `\c` (connect), `\q` (quit).

## pgAdmin (GUI)
- Install via PostgreSQL package or separately.
- Features: Query tool, server monitoring.

## Creating Databases
- CLI: `createdb dbname` or `CREATE DATABASE dbname;`.
- GUI: Use pgAdmin interface.

## Roles/Users
- Create: `CREATE ROLE username WITH LOGIN PASSWORD 'pass';`.
- Grant: `GRANT PRIVILEGES ON DATABASE dbname TO username;`.

**Links:** [PostgreSQL Docs](https://www.postgresql.org/docs/)
