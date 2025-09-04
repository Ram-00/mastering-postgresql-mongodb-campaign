# Week 2, Day 6: Backup, Restore & Database Maintenance

## Overview

This day covers PostgreSQL backup types, logical dumps with pg_dump, restoring databases, and essential maintenance commands such as VACUUM and ANALYZE. Focus is on ensuring data durability and database health.

## Files

- `notes.md` – Concepts and best practices for backup and maintenance.
- `backup-commands.sh` – Shell script examples for backup and restore.
- `vacuum-analyze.sql` – SQL commands for vacuuming and analyzing.
- `practice-notes.md` – Summary of practical exercises and measured observations.
- `reflection.md` – Reflection on learnings and challenges.
  
## How to Run

1. Ensure the database `week2_testdb` exists.
2. Run backup commands from `backup-commands.sh` or manually using pg_dump/pg_restore.
3. Execute vacuum and analyze commands with:
```
\i vacuum-analyze.sql
```
4. Monitor database size and health using stats queries.

## Verification Checklist

- [ ] Successful logical backup and restore complete without errors.
- [ ] VACUUM FULL reclaims unused space after bulk deletes.
- [ ] ANALYZE provides accurate statistics for query planner.
- [ ] Backup scripts executable independently.
- [ ] Documentation clearly defines backup and maintenance procedures.

## Tips

- Schedule backups during low activity windows.
- Avoid long VACUUM FULL on production without maintenance windows.
- Test backup and restore regularly as part of disaster recovery drills.

---
