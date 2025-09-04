#!/bin/bash
# Backup week2_testdb in custom format
pg_dump -U postgres -F c -f week2_testdb_custom.backup week2_testdb

# Restore into new DB
pg_restore -U postgres -C -d postgres -j 4 week2_testdb_custom.backup

# Dump schema-only (week2 schema)
pg_dump -U postgres -n week2 -s -f week2_schema_only.sql week2_testdb

# Plain SQL dump
pg_dump -U postgres -F p -f week2_full.sql week2_testdb