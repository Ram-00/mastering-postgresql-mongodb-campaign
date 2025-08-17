# Day 2 Notes: Constraints, Data Integrity, and Validation

## Why Constraints Matter
- Enforce correctness at the source of truth.
- Prevent bad data from entering the system.
- Reduce complexity in application code by shifting invariants to the DB.

## Constraint Types
- PRIMARY KEY: unique row identity (implies NOT NULL).
- UNIQUE: no duplicates across specified columns.
- NOT NULL: column must be present.
- CHECK: boolean expression must be true.
- FOREIGN KEY: ensures referenced rows exist, with ON DELETE/UPDATE behaviors.
- EXCLUDE: prevents conflicts using operators (e.g., range overlaps).

## Key Features
- DEFERRABLE constraints allow validation at COMMIT.
- Partial unique indexes implement conditional uniqueness.
- Generated columns compute values from other columns.
- Domains encapsulate reusable validation rules.

## Patterns
- One default per group: partial unique index.
- Non-overlapping schedules: EXCLUDE with ranges.
- Money math: CHECK totals >= 0; use NUMERIC to avoid floating errors.
- Reference integrity: FK with appropriate ON DELETE rules (CASCADE, RESTRICT, SET NULL).

## Gotchas
- Don’t rely only on app checks; race conditions can admit invalid rows.
- EXCLUDE needs gist operator classes (e.g., btree_gist).
- DEFERRABLE adds overhead; use only when required.
- Always align cascade behavior with business policy.
