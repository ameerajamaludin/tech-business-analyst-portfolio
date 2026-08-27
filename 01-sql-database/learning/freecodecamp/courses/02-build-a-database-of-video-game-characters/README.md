# Learn Relational Databases by Building a Database of Video Game Characters

This folder contains my notes from the **Learn Relational Databases by Building a Database of Video Game Characters** workshop in freeCodeCamp's Relational Database Certification.

## Overview

In this workshop, I learned the fundamentals of relational databases by creating and managing a PostgreSQL database containing video game character data.

The workshop introduced PostgreSQL, SQL commands, tables, columns, rows, data types, constraints, primary keys, foreign keys, and relationships between tables.

## PostgreSQL

### Access PostgreSQL

Connect to PostgreSQL using:

```bash
psql --username=freecodecamp --dbname=postgres
```

### List Databases

Use `\l` to display the available databases.

```sql
\l
```

### Create a Database

Use `CREATE DATABASE` to create a new database.

```sql
CREATE DATABASE database_name;
```

### Connect to a Database

Use `\c` to connect to a database.

```sql
\c database_name
```

## Tables

A relational database organizes data into **tables**.

Tables contain:

* **Columns** — define the attributes or fields of the data.
* **Rows** — contain individual records.

### Create a Table

```sql
CREATE TABLE table_name();
```

### List Tables

```sql
\d
```

### View Table Details

```sql
\d table_name
```

### Rename a Table

```sql
ALTER TABLE old_name
RENAME TO new_name;
```

### Delete a Table

```sql
DROP TABLE table_name;
```

## Columns

### Add a Column

```sql
ALTER TABLE table_name
ADD COLUMN column_name DATA_TYPE;
```

Example:

```sql
ALTER TABLE characters
ADD COLUMN name VARCHAR(30);
```

### Rename a Column

```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```

### Delete a Column

```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```

## Data Types

Some PostgreSQL data types used in this workshop include:

| Data Type    | Description                                |
| ------------ | ------------------------------------------ |
| `INT`        | Integer values                             |
| `SERIAL`     | Auto-incrementing integer                  |
| `VARCHAR(n)` | Variable-length text with a maximum length |
| `TEXT`       | Variable-length text                       |
| `NUMERIC`    | Numeric values                             |
| `DATE`       | Date values                                |

## Rows and Data

### Insert Data

Use `INSERT INTO` to add rows to a table.

```sql
INSERT INTO table_name(column_name)
VALUES(value);
```

Multiple columns can be inserted at the same time:

```sql
INSERT INTO table_name(column1, column2)
VALUES(value1, value2);
```

### View Data

Use `SELECT` to retrieve data from a table.

```sql
SELECT * FROM table_name;
```

Specific columns can also be selected:

```sql
SELECT column1, column2
FROM table_name;
```

### Update Data

Use `UPDATE` to modify existing data.

```sql
UPDATE table_name
SET column_name = value
WHERE condition;
```

### Delete Data

Use `DELETE` to remove rows.

```sql
DELETE FROM table_name
WHERE condition;
```

## Constraints

Constraints define rules for the data stored in a table.

### NOT NULL

`NOT NULL` prevents a column from containing null values.

```sql
ALTER TABLE table_name
ALTER COLUMN column_name SET NOT NULL;
```

### UNIQUE

`UNIQUE` prevents duplicate values in a column.

```sql
ALTER TABLE table_name
ADD UNIQUE(column_name);
```

## Primary Keys

A **primary key** uniquely identifies each row in a table.

Example:

```sql
ALTER TABLE table_name
ADD PRIMARY KEY(column_name);
```

Primary keys must contain unique, non-null values.

## Foreign Keys

A **foreign key** creates a relationship between two tables.

```sql
ALTER TABLE table_name
ADD FOREIGN KEY(column_name)
REFERENCES other_table(column_name);
```

This allows data stored in different tables to be connected.

## Relationships

Relational databases allow related information to be separated into different tables instead of storing everything in a single table.

For example:

```text
characters
     │
     ├── character_id
     ├── name
     └── homeland_id
              │
              ▼
          more_info
```

A foreign key can be used to connect related records between these tables.

## SQL Commands Learned

| Command           | Purpose                             |
| ----------------- | ----------------------------------- |
| `CREATE DATABASE` | Create a database                   |
| `CREATE TABLE`    | Create a table                      |
| `ALTER TABLE`     | Modify a table                      |
| `DROP TABLE`      | Delete a table                      |
| `ADD COLUMN`      | Add a column                        |
| `DROP COLUMN`     | Delete a column                     |
| `INSERT INTO`     | Add data                            |
| `SELECT`          | Retrieve data                       |
| `UPDATE`          | Modify existing data                |
| `DELETE`          | Delete data                         |
| `PRIMARY KEY`     | Uniquely identify records           |
| `FOREIGN KEY`     | Create relationships between tables |
| `UNIQUE`          | Prevent duplicate values            |
| `NOT NULL`        | Require a value                     |

## PostgreSQL Commands Learned

| Command            | Purpose                           |
| ------------------ | --------------------------------- |
| `\l`               | List databases                    |
| `\c database_name` | Connect to a database             |
| `\d`               | List tables                       |
| `\d table_name`    | Display information about a table |

## Key Concepts

Through this workshop, I learned about:

* Relational databases
* PostgreSQL
* SQL
* Databases
* Tables
* Columns and rows
* Data types
* CRUD operations
* Primary keys
* Foreign keys
* Constraints
* Relationships between tables

## What I Learned

This workshop helped me understand how relational databases organize information into related tables.

I learned how to create and modify PostgreSQL databases using SQL, insert and retrieve records, apply constraints to maintain data integrity, and establish relationships between tables using primary and foreign keys.

## Course

**freeCodeCamp — Relational Database Certification**

**Course:** Learn Relational Databases by Building a Database of Video Game Characters

## Status

✅ Completed
