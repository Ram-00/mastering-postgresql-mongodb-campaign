# Day 2 Practice Notes

## What I Implemented
- Added CHECK constraints for prices and date ranges.
- Used partial unique indexes for single default address and primary payment method.
- Created EXCLUDE constraint with TSRANGE to block overlapping bookings.
- Added generated column `line_total` to order_items.
- Demonstrated DEFERRABLE FKs and setting constraints DEFERRED in a transaction.

## Tests Performed
- Attempted invalid inserts to ensure constraints block bad data.
- Verified partial unique indexes by trying to add a second default/primary flag.
- Confirmed that back-to-back time slots do not overlap (touching endpoints ok).
- Aggregated order totals using generated columns.

## Observations
- Constraints provide immediate, clear failures that prevent data corruption.
- Partial unique indexes are a powerful alternative to triggers for conditional uniqueness.
- DEFERRABLE is helpful for multi-step referential updates but should be used sparingly.
- EXCLUDE with ranges simplifies conflict detection for scheduling use cases.