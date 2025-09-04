# Day 6 Practice Notes

## Activities Done
- Created full database logical backup in custom format.
- Restored backup to test database, verified schema and data integrity.
- Used VACUUM FULL to reclaim space after bulk deletes.
- Ran ANALYZE to update planner statistics.
- Measured table sizes using pg_stat_user_tables before and after maintenance.
- Drafted cron job command to schedule nightly backups.

## Observations
- Restores succeed quickly with parallel jobs.
- VACUUM FULL requires exclusive lock; avoided on busy systems.
- ANALYZE necessary after bulk DML for accurate query plans.
- Autovacuum prevents bloat but may lag on heavy write workloads.

---

**Notes**
- Always test restore in a separate environment.
- Automate backups for safety.
- Investigate slow autovacuum warnings early.