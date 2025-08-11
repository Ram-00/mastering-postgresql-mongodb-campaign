# Day 1 Practice Notes

## Normalization Exercise Completed
- Started with denormalized order data containing customer and product details
- Applied 1NF: Ensured atomic values, no repeating groups
- Applied 2NF: Moved product details to products table, customer details to customers table
- Applied 3NF: Created separate categories table, used junction table for M:N relationship

## Junction Table Implementation
- Successfully created `product_categories` with composite primary key
- Tested M:N relationships with sample data
- Verified no duplicate relationships possible due to PK constraint

## Cascade Behavior Testing
- Implemented `ON DELETE CASCADE` from customers to addresses
- Tested deletion: removing customer also removes their addresses
- Left orders without cascade to preserve business history

## Query Results
- All relationship queries work correctly
- Complex joins between customers, orders, and products successful
- Aggregate queries (order totals) performing well

---

**Key Learnings:**
- Junction tables require composite PKs to prevent duplicates
- Cascade decisions should align with business rules
- Proper normalization eliminates update/insert/delete anomalies
- Foreign key constraints maintain data integrity automatically