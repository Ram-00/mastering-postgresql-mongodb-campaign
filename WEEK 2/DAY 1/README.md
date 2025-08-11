# Week 2, Day 1: Relational Modeling and Normalization

This folder contains all materials for learning relational database design and normalization principles.

## Files Overview

- `notes.md` - Core concepts and theory
- `schema.sql` - Complete PostgreSQL schema in 3NF
- `seed.sql` - Sample data for testing relationships
- `queries.sql` - Example queries demonstrating relationships
- `normalization-walkthrough.md` - Step-by-step 1NF→2NF→3NF process
- `practice-notes.md` - Personal learning notes and observations
- `reflection.md` - Daily reflection and insights

## How to Run

1. Connect to your `week2_testdb` database
2. Execute files in this order:

```
\i schema.sql

\i seed.sql

\i queries.sql
```
## Key Learning Objectives

✅ Understand functional dependencies and normal forms
✅ Design proper entity relationships (1:1, 1:N, M:N)
✅ Implement junction tables with composite keys
✅ Use foreign keys with appropriate cascade behavior
✅ Create normalized schemas following industry best practices

## Verification Checklist

- [ ] All tables in 3NF (no partial or transitive dependencies)
- [ ] M:N relationships use junction tables with composite PKs
- [ ] Foreign keys enforce referential integrity
- [ ] Cascade behaviors align with business rules
- [ ] Sample queries return expected results
- [ ] Schema supports common e-commerce operations

## Schema Summary

**Core Entities:** customers, products, categories, orders
**Relationships:** 
- customers 1:N addresses
- customers 1:N orders  
- products M:N categories (via junction)
- orders 1:N order_items
- products 1:1 inventory
