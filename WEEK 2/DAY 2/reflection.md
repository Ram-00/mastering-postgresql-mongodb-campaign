# Day 2 Reflection

## Wins
- Strong grasp of when to choose CASCADE vs RESTRICT vs SET NULL.
- Comfortable writing composite PKs and partial unique indexes.
- Successfully modeled time-based conflicts with EXCLUDE constraints.

## Challenges
- Remembering to enable `btree_gist` extension before EXCLUDE using scalars.
- Getting used to DEFERRABLE semantics and when to defer constraints.

## Takeaways
- Push as many invariants as possible into the database.
- Prefer declarative constraints over procedural triggers when feasible.
- Document every business rule implemented as a constraint for clarity and onboarding.

## Next Steps
- Explore advanced indexes (BRIN, partial, covering) and query plans.
- Add test scripts that intentionally break rules to verify protections.
- Consider domains for phone numbers and stricter email checks.

**Commit Message:**
`feat: Week 2 Day 2 — constraints, data integrity rules, exclusion constraints, and deferrable FKs`