# Week 2: Relational Modeling, Normalization, and Data Integrity (PostgreSQL)

## 📅 Overview

This week focuses on turning business data into robust relational designs, normalizing to 3NF, and enforcing rules with PostgreSQL constraints. The aim is to build industry-grade schemas that are clean, consistent, and reproducible, supported by hands-on SQL and portfolio-ready documentation.

***

## 🗂️ Contents

- day1/notes.md — Relational modeling concepts, keys, relationships, normalization (1NF→2NF→3NF).
- day1/schema.sql — E-commerce core schema in 3NF with PK/FK and junction tables.
- day1/seed.sql — Minimal seed data to validate relationships.
- day1/queries.sql — Joins, lookups, and integrity checks.
- day1/normalization-walkthrough.md — Step-by-step decomposition from denormalized CSV.
- day1/practice-notes.md — Notes on exercises, results, and pitfalls.
- day1/reflection.md — Design choices, trade-offs, and lessons learned.
- day2/notes.md — Constraint types, DEFERRABLE, partial unique indexes, EXCLUDE.
- day2/schema.sql — Constraints-focused DDL (CHECKs, cascades, generated columns, EXCLUDE).
- day2/seed.sql — Sample data to test validation rules.
- day2/queries.sql — Constraint verification and integrity reports.
- day2/practice-notes.md — Experiment logs and outcomes.
- day2/reflection.md — Insights on data integrity and business-rule enforcement.

***

## 🚩 Learning Outcomes

- Model entities and relationships with correct PK/FK strategy and junction tables.
- Apply 1NF, 2NF, and 3NF to eliminate anomalies and redundancy.
- Enforce business rules using NOT NULL, UNIQUE, CHECK, FOREIGN KEY, EXCLUDE, and partial unique indexes.
- Use DEFERRABLE constraints and ON DELETE/UPDATE actions appropriately.
- Produce reproducible SQL artifacts with clear documentation for interviews and project reviews.

***

## 🧭 How to Use This Week

- Create and work inside the database week2_testdb.
- Execute schema.sql → seed.sql → queries.sql for each day.
- Keep search_path set to week2, public when running scripts individually.
- Commit after each milestone with clear messages describing changes.

***

## 🧩 Industry Focus

- E-commerce schema patterns (customers, orders, products, categories, inventory).
- Many-to-many modeling via junction tables with composite PKs.
- Real-world data integrity techniques: conditional uniqueness, time-range conflict prevention, and cascade policies aligned with business rules.

***

## 🗂️ Repo Hygiene

- All SQL in code blocks with clear run order.
- Each day includes notes, practice-notes, and reflection for portfolio clarity.
- Use consistent naming: snake_case, singular/plural conventions, explicit PK/FK names when helpful.

***

## 🔗 Further Reading

- PostgreSQL Constraints and Keys — official docs
- Normalization (1NF–3NF, BCNF) — conceptual guides and examples
- Many-to-many modeling and foreign key best practices — practical tutorials and patterns

---
