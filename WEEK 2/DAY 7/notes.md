# Day 7 Notes: Security, Roles, and Permissions

## Roles and Users
- PostgreSQL unifies users and groups into **roles**.
- Roles with `LOGIN` attribute are users.
- Assign roles to other roles for group membership.

## Privileges
- Database: CONNECT
- Schema: USAGE
- Tables/Views: SELECT, INSERT, UPDATE, DELETE, TRUNCATE, REFERENCES, TRIGGER
- Functions: EXECUTE
- Grant and revoke carefully.

## Role Attributes
- SUPERUSER: full access (dangerous).
- CREATEDB: can create DBs.
- CREATEROLE: can create/alter roles.
- CONNECTION LIMIT controls concurrent sessions.

## Default Privileges
- Use `ALTER DEFAULT PRIVILEGES` to automate grants on future objects.

## Row-Level Security (RLS)
- Provides fine-grained access control.
- Define policies filtering rows per user or condition.
- Enabled per table, mandatory when policies exist.

## Best Practices
- Grant least privilege principle.
- Audit roles and memberships regularly.
- Avoid superuser for apps.
- Use secure passwords and SSL connections.
- Enable logging for security events.

---

## References
- https://www.postgresql.org/docs/current/user-manag.html
- https://www.postgresql.org/docs/current/ddl-rowsecurity.html