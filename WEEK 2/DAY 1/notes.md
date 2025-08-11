# Day 1 Notes: Relational Modeling and Normalization

## Key Concepts

### Entities and Relationships
- **Entity**: A real-world object (Customer, Product, Order)
- **1:N Relationship**: One customer has many orders
- **M:N Relationship**: Products belong to many categories

### Normal Forms
- **1NF**: Atomic values, no repeating groups
- **2NF**: No partial dependencies on composite keys
- **3NF**: No transitive dependencies

### Junction Tables
For M:N relationships, create a bridge table:
```
CREATE TABLE product_categories (

product_id BIGINT REFERENCES products(product_id),

category_id BIGINT REFERENCES categories(category_id),

PRIMARY KEY (product_id, category_id)

);
```
### Foreign Key Cascades
- `ON DELETE CASCADE`: Deletes dependent records
- `ON DELETE RESTRICT`: Prevents deletion if dependents exist
- `ON DELETE SET NULL`: Sets FK to NULL

**Links:**
- [PostgreSQL Foreign Keys](https://www.postgresql.org/docs/current/ddl-constraints.html)
- [Database Normalization Guide](https://www.freecodecamp.org/news/database-normalization-1nf-2nf-3nf-table-examples/)