# Day 6 Reflection

## Wins
- Hands-on experience with pg_dump and pg_restore workflows.
- Understood trade-offs between logical and physical backups.
- Learned to maintain database health proactively using vacuuming.
- Improved confidence in backup strategy documentation.

## Challenges
- Balancing VACUUM FULL's table lock impact with performance needs.
- Scheduling backups without impacting production workload.

## Key Takeaways
- Regular backups and maintenance are critical for data safety and reliability.
- Always verify restore integrity in testing before trusting backups.
- Use monitoring to catch autovacuum delays and bloat early.

---

**Commit Message:**
`feat: Week 2 Day 6 - backup, restore, vacuum, analyze, and maintenance scripting`