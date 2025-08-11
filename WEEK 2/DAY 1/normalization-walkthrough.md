# Normalization Walkthrough: 1NF → 2NF → 3NF

## Original Denormalized Data
```
order_id | order_date | customer_email | customer_name | product_sku | product_name | category | quantity | unit_price

1        | 2025-08-10 | [alice@test.com](mailto:alice@test.com) | Alice Smith   | LAPTOP001   | Gaming Laptop| Electronics | 1     | 1299.99

1        | 2025-08-10 | [alice@test.com](mailto:alice@test.com) | Alice Smith   | MOUSE001    | Wireless Mouse| Electronics | 2     | 29.99

2        | 2025-08-11 | [bob@test.com](mailto:bob@test.com)   | Bob Johnson   | BOOK001     | SQL Guide    | Books       | 1     | 39.95
```
```
order_id | order_date | customer_email | customer_name | product_sku | product_name | category | quantity | unit_price

1        | 2025-08-10 | [alice@test.com](mailto:alice@test.com) | Alice Smith   | LAPTOP001   | Gaming Laptop| Electronics | 1     | 1299.99

1        | 2025-08-10 | [alice@test.com](mailto:alice@test.com) | Alice Smith   | MOUSE001    | Wireless Mouse| Electronics | 2     | 29.99

2        | 2025-08-11 | [bob@test.com](mailto:bob@test.com)   | Bob Johnson   | BOOK001     | SQL Guide    | Books       | 1     | 39.95

```
## Problems Identified
- **Update Anomaly**: Changing Alice's email requires multiple row updates
- **Insert Anomaly**: Can't add customer without an order
- **Delete Anomaly**: Deleting last order loses customer information
- **Storage Waste**: Repeated customer and product data

## Step 1: First Normal Form (1NF)
- ✅ Each cell contains atomic values
- ✅ No repeating groups
- ✅ Each row represents one order item

## Step 2: Second Normal Form (2NF)
**Functional Dependencies Identified:**
- order_id → order_date, customer_email, customer_name
- product_sku → product_name, category
- (order_id, product_sku) → quantity, unit_price

**Tables After 2NF:**
- - Orders table

orders: order_id, order_date, customer_email, customer_name

- - Products table

products: product_sku, product_name, category

- - Order Items table

order_items: order_id, product_sku, quantity, unit_price

## Step 3: Third Normal Form (3NF)
**Transitive Dependencies Found:**
- customer_email → customer_name (non-key → non-key)
- product_name → category (non-key → non-key)

**Final 3NF Tables:**
-  Customers table

        customers: customer_id, email, full_name

- Categories table

        categories: category_id, name

- Products table

        products: product_id, sku, name, price

- Product-Categories junction

        product_categories: product_id, category_id

- Orders table

        orders: order_id, customer_id, order_date

- Order Items table

        order_items: order_id, product_id, quantity, unit_price

## Benefits Achieved
- ✅ Eliminated all update anomalies
- ✅ Eliminated insert anomalies
- ✅ Eliminated delete anomalies
- ✅ Reduced storage redundancy
- ✅ Enforced data integrity with constraints