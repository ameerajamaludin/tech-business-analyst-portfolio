# SQL Business Analysis Case Study: E-Commerce Product Analytics

## Overview

This case study is an independent SQL project designed to apply the database and analytical skills for:

* for Relational Database Management System (RDBMS)

Rather than following a guided tutorial, this project uses a simulated e-commerce database and a series of progressively more complex business questions.

The objective is to practise using SQL not only to retrieve data, but to investigate business performance, customer behaviour, acquisition, revenue, product performance, and retention.

## Business Scenario

Assume I am a Business Analyst working for an e-commerce company.

The company collects data about:

* customer registrations
* acquisition channels
* products
* customer orders
* products purchased within each order

My responsibility is to analyse this data and answer questions that could support business and product decisions.

## Database Structure

The database contains four primary tables:

### `users`

Stores customer information.

```text
user_id
signup_date
country
acquisition_channel
```

### `products`

Stores the product catalogue.

```text
product_id
product_name
category
price
```

### `orders`

Stores customer orders.

```text
order_id
user_id
order_date
status
```

### `order_items`

Stores the individual products included in each order.

```text
order_id
product_id
quantity
price
```

## Mission 0 — Database Understanding & ERD

Before starting the SQL analysis, create an Entity Relationship Diagram (ERD) for the four-table database.

The ERD should identify:

* primary keys
* foreign keys
* relationships between tables
* relationship cardinality

Save the completed ERD as:

```text
docs/erd.png
```

## Case Study Questions

### Level 1 — SQL Foundations

* [x] How many users do we have?
* [x] How many orders do we have?
* [x] What are our 10 most expensive products?

### Level 2 — Revenue Analysis

* [x] How much revenue did we generate?
* [x] What is our revenue by month?
* [x] What is our revenue by product category?
* [x] Which country generates the most revenue?

### Level 3 — Business Performance

* [x] What is our average order value?
* [x] Which acquisition channel generates the most customers?
* [x] Which acquisition channel generates the most revenue?
* [x] What percentage of users actually make a purchase?

### Level 4 — Customer Analysis

* [x] Who are our repeat customers?
* [x] What is our repeat purchase rate?
* [x] How many new users do we acquire each month?
* [x] What is our Monthly Active Users (MAU)?
* [x] What is our Average Revenue Per User (ARPU)?

### Level 5 — Advanced Analysis

* [x] What is our customer retention?
* [x] Rank products by revenue within each category.
* [x] Calculate month-over-month revenue growth.
* [x] Identify customers whose spending is above average.

## Learning Approach

This project follows a project-based learning approach.

For each business question:

1. Understand the business question.
2. Identify the tables and fields required.
3. Attempt the SQL query independently.
4. Research or review SQL concepts only when needed.
5. Validate the query result.
6. Interpret what the result means from a business perspective.
7. Document the resulting insight.

The focus is therefore not simply on writing syntactically correct SQL, but on translating business questions into data analysis and communicating useful findings.

## Project Structure

```text
ecommerce-product-analytics/
├── README.md
├── schema.sql
├── seed.sql
├── docs/
│   └── README.md
├── queries/
│   ├── level-01-sql-foundations.sql
│   ├── level-02-revenue-analysis.sql
│   ├── level-03-business-performance.sql
│   ├── level-04-customer-analysis.sql
│   └── level-05-advanced-analysis.sql
└── insights/
    └── business-insights.md
```

## Setup

1. Create a PostgreSQL database, for example `ecommerce_analytics`.
2. Run `schema.sql`.
3. Run `seed.sql`.
4. Complete Mission 0 by creating the ERD.
5. Start with `queries/level-01-sql-foundations.sql`.

## Key Findings

The analysis identified several patterns across revenue, acquisition, customer behaviour, and product performance:

- Completed orders generated 1,757.00* in total revenue, with May 2026 recording the highest monthly revenue at 448.00.
- Fashion was the highest-revenue product category at 540.00, with the Structured Tote Bag contributing 340.00.
- All acquisition channels contributed the same number of registered users, but Organic Search generated the highest revenue at 561.00, showing that equal acquisition volume did not translate into equal customer value.
- The repeat purchase rate among purchasing customers was 23.53%, while next-month retention was generally low across the observed period.
- Revenue showed considerable month-to-month variation, with the strongest growth in May (+60.57%) followed by the largest decline in June (-42.19%).
