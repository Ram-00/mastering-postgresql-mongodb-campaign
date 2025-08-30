# Day 3 Reflection

## Wins
- Comfortable reading EXPLAIN ANALYZE and identifying Seq vs Index/Bitmap scans.
- Built targeted indexes for common access paths and verified improvements.
- Successfully used partial and covering indexes without triggers.

## Challenges
- Achieving consistent index-only scans depends on visibility map; not always guaranteed.
- Balancing index count with write overhead requires discipline and monitoring.

## Takeaways
- Start from real query patterns; design indexes to match predicates, joins, and ordering.
- Validate with EXPLAIN ANALYZE; don't rely on assumptions.
- Keep statistics fresh; adjust STATISTICS target for skew.

## Next Steps
- Explore advanced indexing (trigram for fuzzy search, partial GIN, composite JSONB keys).
- Practice dropping redundant indexes based on pg_stat_user_indexes usage stats.

**Commit Message:**
`feat: Week 2 Day 3 — indexing strategies, explain analyze, and performance tuning demos`