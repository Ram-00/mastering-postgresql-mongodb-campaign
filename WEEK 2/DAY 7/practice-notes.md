# Day 7 Practice Notes

## Roles and Privileges
- Created reporting and developer group roles.
- Added users alice and bob with LOGIN privileges.
- Granted schema, database, and table level privileges.
- Verified privilege grants and default privileges on new tables.

## Row-Level Security (RLS)
- Enabled RLS on orders table.
- Created policy filtering rows per user session setting.
- Tested behavior by changing `app.current_customer_id` parameter.
- Confirmed users see only their designated orders.

## Observations
- Group roles simplify privilege management.
- Default privileges save repetitive grants.
- RLS provides powerful per-row filtering but needs careful session context setup.

---

**Learnings**
- Least privilege is central to security.
- Managing roles centrally simplifies complex access requirements.
- RLS is essential for multi-tenant or highly sensitive applications.