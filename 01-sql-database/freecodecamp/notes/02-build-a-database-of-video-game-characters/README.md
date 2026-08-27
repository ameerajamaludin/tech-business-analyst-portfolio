# Learn Relational Databases by Building a Mario Database

This folder contains my notes from the **Learn Relational Databases by Building a Mario Database** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I built `mario_database` in PostgreSQL and filled it with video game characters, their details, sounds, and actions. The work moved from basic database and table operations to a normalized schema with one-to-one, one-to-many, and many-to-many relationships.

The saved `mario_database.sql` file is the PostgreSQL dump produced from the workshop database.

## Connecting to PostgreSQL

```bash
psql --username=freecodecamp --dbname=postgres
```

Inside `psql`, I used `\l` to list databases, `\c mario_database` to connect, `\d` to list tables, and `\d characters` to inspect a table.

## Database Structure

| Table | Purpose | Relationship |
| --- | --- | --- |
| `characters` | Character name, homeland, and favorite color | Parent table |
| `more_info` | Birthday, height, and weight | One-to-one with `characters` |
| `sounds` | Multiple sound filenames | Many-to-one with `characters` |
| `actions` | Available actions | Linked through `character_actions` |
| `character_actions` | Character/action pairs | Many-to-many junction table |

The junction table uses a composite primary key so the same character/action pair cannot be repeated.

## Creating and Changing Tables

```sql
CREATE DATABASE mario_database;
CREATE TABLE characters();

ALTER TABLE characters
ADD COLUMN character_id SERIAL PRIMARY KEY;

ALTER TABLE characters
ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL;
```

I used `ALTER TABLE` to add, rename, and drop columns and constraints. The workshop used `INT`, `SERIAL`, `VARCHAR`, `TEXT`, `NUMERIC`, and `DATE` for the values stored in the tables.

## Rows and Queries

```sql
INSERT INTO characters(name, homeland, favorite_color)
VALUES ('Mario', 'Mushroom Kingdom', 'Red');

UPDATE characters
SET favorite_color = 'Yellow'
WHERE name = 'Bowser';

DELETE FROM characters WHERE name = 'Samus';
SELECT character_id, name FROM characters ORDER BY character_id;
```

`WHERE` limits an update or delete to the intended rows. `ORDER BY` controls the order of query results.

## Keys and Relationships

```sql
ALTER TABLE more_info
ADD FOREIGN KEY(character_id) REFERENCES characters(character_id);

ALTER TABLE character_actions
ADD PRIMARY KEY(character_id, action_id);
```

Primary keys identify rows, foreign keys connect related rows, and `UNIQUE` plus `NOT NULL` enforce data rules. The workshop queried relationships with `FULL JOIN`, including complete character/details and character/sounds results.

## Key Takeaways

- A relational design separates different kinds of facts into related tables.
- Primary, foreign, and composite keys protect the structure of those relationships.
- Constraints reject missing or duplicate values where the model requires them.
- `INSERT`, `SELECT`, `UPDATE`, and `DELETE` cover the core row operations.
- Joins bring normalized data back together for reporting.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Relational Databases by Building a Mario Database

**Topics:** PostgreSQL · SQL · Tables · Constraints · Keys · Relationships · Joins

## Status

✅ Completed
