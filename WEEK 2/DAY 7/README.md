# Week 2, Day 7: Security, Roles, and Permissions

## Overview

This day covers managing PostgreSQL roles and privileges, securing databases and objects, enabling row-level security (RLS), and applying best practices for production-ready security.

## Files

- `notes.md` — Security architecture, role and privilege concepts, RLS introduction.
- `setup-roles.sql` — Script to create users, groups, grant/revoke privileges, and default privileges.
- `rls-example.sql` — Example of enabling RLS and defining row-level policies.
- `practice-notes.md` — Notes on role management and RLS test outcomes.
- `reflection.md` — Reflections on security implementations and challenges.

## How to Run

1. Connect to `week2_testdb`.
2. Run:
```
\i setup-roles.sql

\i rls-example.sql
```
text3. Test RLS by setting session parameters and running SELECT queries.

## Verification Checklist

- [ ] Roles created with proper LOGIN and group membership.
- [ ] Privileges granted and default privileges set.
- [ ] RLS enabled and policies filter rows correctly.
- [ ] Users cannot access objects without granted privileges.

## Tips

- Always test permissions with actual user sessions.
- Use connection poolers or application roles to manage session security.
- Audit role memberships regularly.

---
