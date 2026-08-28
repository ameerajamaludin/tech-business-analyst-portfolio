# Periodic Table Database

A PostgreSQL relational database and Bash command-line application built as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-periodic-table-database/lab-periodic-table-database).

The project stores information about chemical elements in a normalized PostgreSQL database and provides a Bash script for searching elements by **atomic number, symbol, or name**.

## Project Overview

The goal of this project was to practice maintaining and querying an existing relational database while building a simple command-line interface for retrieving element information.

The project involves:

* Working with an existing PostgreSQL database
* Modifying and improving a relational database schema
* Managing primary and foreign key relationships
* Normalizing element data across related tables
* Querying multiple tables with SQL joins
* Integrating PostgreSQL queries into Bash
* Accepting command-line arguments
* Handling missing or invalid input
* Formatting database results for terminal output
* Managing project changes with Git

## Database Structure

The database uses three related tables to store information about chemical elements.

### `elements`

Stores the identity of each chemical element.

| Column          | Description                        |
| --------------- | ---------------------------------- |
| `atomic_number` | Primary identifier for the element |
| `symbol`        | Chemical symbol                    |
| `name`          | Element name                       |

### `properties`

Stores the physical properties associated with each element.

| Column                  | Description                          |
| ----------------------- | ------------------------------------ |
| `atomic_number`         | References the corresponding element |
| `atomic_mass`           | Atomic mass of the element           |
| `melting_point_celsius` | Melting point in degrees Celsius     |
| `boiling_point_celsius` | Boiling point in degrees Celsius     |
| `type_id`               | References the element's type        |

### `types`

Stores the available classifications for elements.

| Column    | Description                            |
| --------- | -------------------------------------- |
| `type_id` | Unique identifier for the element type |
| `type`    | Element classification                 |

## Database Relationships

```text
elements
└── atomic_number
        │
        └──── properties.atomic_number
                    │
                    └──── type_id
                            │
                            └──── types.type_id
```

The structure separates element identity, physical properties, and element classifications into related tables.

This reduces unnecessary duplication and allows the application to combine the required information through SQL joins.

## Element Lookup

The `element.sh` script accepts one command-line argument.

An element can be searched using:

* Atomic number
* Chemical symbol
* Element name

### Search by Atomic Number

```bash
./element.sh 1
```

### Search by Symbol

```bash
./element.sh H
```

### Search by Name

```bash
./element.sh Hydrogen
```

Each of these searches retrieves the corresponding element from the database.

## Example Output

```text
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

The output combines information from the `elements`, `properties`, and `types` tables into a readable description.

## SQL Query

The application retrieves element information using joins between the three related tables:

```sql
SELECT
  e.atomic_number,
  e.name,
  e.symbol,
  t.type,
  p.atomic_mass,
  p.melting_point_celsius,
  p.boiling_point_celsius
FROM elements e
JOIN properties p
  ON e.atomic_number = p.atomic_number
JOIN types t
  ON p.type_id = t.type_id
WHERE e.atomic_number::VARCHAR = '$1'
   OR e.symbol = '$1'
   OR e.name = '$1';
```

This query allows the same command-line argument to match an element by its atomic number, symbol, or name.

## Input Handling

The application handles several possible user inputs.

### Missing Argument

Running the script without an argument:

```bash
./element.sh
```

returns:

```text
Please provide an element as an argument.
```

### Element Not Found

If the argument does not match an element in the database:

```bash
./element.sh Unknown
```

the application returns:

```text
I could not find that element in the database.
```

This prevents the application from attempting to format an empty database result.

## Technologies

* PostgreSQL
* SQL
* Bash
* Git
* GitHub

## Project Files

```text
periodic-table-database/
├── element.sh
├── periodic_table.sql
└── README.md
```

### `element.sh`

Command-line application responsible for:

* Accepting an element as an argument
* Querying PostgreSQL
* Searching by atomic number, symbol, or name
* Joining related database tables
* Handling invalid input
* Parsing SQL query results
* Formatting element information for display

### `periodic_table.sql`

PostgreSQL database dump containing the database schema, tables, relationships, constraints, and element data.

## What I Learned

Through this project, I practiced:

* Working with PostgreSQL from the command line
* Understanding and modifying an existing database schema
* Designing normalized relational data structures
* Creating and managing primary and foreign keys
* Using SQL `JOIN` operations
* Querying data across multiple related tables
* Filtering records with `WHERE`
* Working with multiple search conditions using `OR`
* Casting PostgreSQL values between data types
* Executing PostgreSQL queries from Bash
* Accepting command-line arguments with `$1`
* Using Bash conditional statements
* Checking for empty query results
* Parsing query results into Bash variables
* Formatting database information for terminal output
* Using Git to track incremental project changes

## Key Takeaway

This project demonstrates how a normalized relational database can be connected to a simple command-line application.

Rather than storing all information about an element in a single table, the database separates element identity, physical properties, and classifications into related tables.

The Bash application then uses SQL joins to reconstruct the information when a user searches for an element.

This helped reinforce the relationship between **database design, SQL querying, and application logic**.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements and starter database were provided by freeCodeCamp.
