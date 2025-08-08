# Day 5 Practice Notes

- Created table `tasks` with various constraints.
- Inserted 3 valid tasks.
- Test case 1: Tried inserting with missing description → ERROR: null value in column "description" violates not-null constraint.
- Test case 2: Tried inserting with priority 7 → ERROR: new row for relation "tasks" violates check constraint "tasks_priority_check".
- Learned how constraints enforce business logic and ensure database quality.

---
**Tip:** Always read error messages—constraints help prevent invalid data.