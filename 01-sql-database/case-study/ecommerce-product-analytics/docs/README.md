# Mission 0 — Database Understanding & ERD

Create an Entity Relationship Diagram (ERD) for the case-study database before starting the SQL missions.

Your ERD should show:

- all four tables
- primary keys
- foreign keys
- relationships
- cardinality

Save your finished diagram in this folder as:

```text
erd.png
```

## Tables to Model

### users
- user_id
- signup_date
- country
- acquisition_channel

### products
- product_id
- product_name
- category
- price

### orders
- order_id
- user_id
- order_date
- status

### order_items
- order_item_id
- order_id
- product_id
- quantity
- price
