# Day 6 Notes: Backup, Restore, and Database Maintenance

## Backup Types
- Logical backups via pg_dump: flexible, human-readable, schema and data.
- Physical backups via pg_basebackup: raw file-level copies, faster restore.

## Using pg_dump
- Custom format (`-F c`) preferred for flexibility and parallel restore.
- Dump full DB or specific schemas/tables.
- Plain SQL dumps easy to read/edit but slower to restore.

## Restore Strategies
- Use pg_restore for custom/wal backups.
- Plain SQL restored with psql.
- Restore into new DB to test.

## VACUUM and Autovacuum
- VACUUM reclaims space, updates visibility map.
- VACUUM FULL locks table but compacts physically.
- Autovacuum automates VACUUM and ANALYZE to prevent bloat.

## Managing Bloat
- Frequent updates cause dead tuples.
- Monitor table size and vacuum stats via pg_stat tables.
- Reindexing improves performance after heavy DML.

## Scheduling and Monitoring
- Use OS schedulers (cron, Windows Task Scheduler).
- Monitor logs and alert on autovacuum delays.
- Keep backup scripts and policies documented.

---

## References
- https://www.postgresql.org/docs/current/backup-dump.html
- https://wiki.postgresql.org/wiki/Backup_and_Recovery
- https://www.postgresql.org/docs/current/sql-vacuum.html