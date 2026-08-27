# Learn Bash and SQL by Building a Bike Rental Shop

This folder contains my notes from the **Learn Bash and SQL by Building a Bike Rental Shop** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I built an interactive `bike-shop.sh` program backed by PostgreSQL. Its menus list available bikes, rent a selected bike to a customer, show a customer's current rentals, and return a bike.

The workshop connected database queries to Bash functions, input validation, loops, and user-facing messages.

## Database Structure

| Table | Verified columns | Purpose |
| --- | --- | --- |
| `bikes` | `bike_id`, `type`, `size`, `available` | Bike inventory and availability |
| `customers` | `customer_id`, `phone`, `name` | Customer records |
| `rentals` | `rental_id`, `customer_id`, `bike_id`, `date_rented`, `date_returned` | Rental history |

`rentals.customer_id` references `customers`, and `rentals.bike_id` references `bikes`.

## PostgreSQL from Bash

```bash
PSQL="psql -X --username=freecodecamp --dbname=bikes --tuples-only -c"
AVAILABLE_BIKES=$($PSQL "SELECT bike_id, type, size FROM bikes WHERE available = true ORDER BY bike_id")
```

Command substitution captures query output. The script pipes rows into `while read` and uses `IFS="|"` to format a numbered availability list.

## Menu Flow and Functions

The script separates its flow into functions:

```text
MAIN_MENU
├── RENT_MENU
├── RETURN_MENU
└── EXIT
```

`MAIN_MENU` uses `case` to route a selection. Each action returns to the main menu with a success or validation message, keeping the program running until exit.

## Renting a Bike

The rent flow:

1. Queries only bikes where `available = true`.
2. Checks the selected value against `^[0-9]+$`.
3. Confirms the selected bike is available.
4. Looks up a customer by phone number.
5. Inserts a new customer when no record exists.
6. Inserts a row into `rentals`.
7. Updates the bike's `available` value to `false`.

```sql
INSERT INTO rentals(customer_id, bike_id)
VALUES(1, 3);

UPDATE bikes SET available = false WHERE bike_id = 3;
```

## Returning a Bike

The return flow looks up active rentals for the supplied phone number by joining `rentals`, `customers`, and `bikes`. It verifies that the customer actually has the chosen bike, sets `date_returned` to the current timestamp, and makes the bike available again.

```sql
UPDATE rentals SET date_returned = NOW() WHERE rental_id = 7;
UPDATE bikes SET available = true WHERE bike_id = 3;
```

## Validation and Formatting

`[[ ... =~ ^[0-9]+$ ]]` rejects non-numeric menu and bike choices. Empty query results are detected with `-z`. The workshop also used `sed` to remove padding from `psql` output before displaying it.

## Key Takeaways

- Bash can use PostgreSQL as persistent state for an interactive program.
- Functions keep menu, rent, return, and exit behavior separate.
- Validation must happen before database updates.
- Customer lookup avoids creating a duplicate customer for each rental.
- A rental and its bike availability must be updated together to keep inventory accurate.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Bash and SQL by Building a Bike Rental Shop

**Topics:** Bash · PostgreSQL · SQL · Functions · Validation · Joins · CRUD

## Status

✅ Completed
