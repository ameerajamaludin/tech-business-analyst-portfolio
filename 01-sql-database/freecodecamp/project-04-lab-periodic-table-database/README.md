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

The database contains three tables:

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

The database separates element identity, physical properties, and classifications into related tables:

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

The `properties` table connects an element to its physical properties and classification.

This structure reduces unnecessary duplication while allowing the application to reconstruct complete element information through SQL joins.

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

Each search retrieves the corresponding element from the database.

The lookup flow can be represented as:

```text
Command-line argument
        │
        ↓
    element.sh
        │
        ↓
Search by:
├── Atomic number
├── Symbol
└── Name
        │
        ↓
PostgreSQL query
        │
        ↓
Element information
```

## Example Output

A successful search returns the element information as a readable sentence:

```text
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

The output combines information from the `elements`, `properties`, and `types` tables.

## SQL Example: Element Lookup

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

The query:

1. Retrieves the element's identifying information from `elements`.
2. Joins `properties` using `atomic_number`.
3. Joins `types` using `type_id`.
4. Checks the command-line argument against the atomic number, symbol, or name.
5. Returns the combined element information when a match is found.

This allows the same command-line argument to support three different types of element lookup.

## Input Handling

The application handles both missing arguments and searches that do not match an element in the database.

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

Contains the command-line application logic, including:

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

The main lesson from this project was understanding how a normalized relational database can work together with a command-line application to retrieve information from multiple related tables.

Rather than storing all information about an element in a single table, the database separates the data into three areas:

```text
elements
   │
   │  Element identity
   ↓
properties
   │
   │  Physical properties
   ↓
types
      Element classification
```

The Bash application then uses SQL joins to reconstruct the complete information when a user searches for an element.

For example, a search for `Hydrogen` does not require all of its information to exist in one database record. The application can retrieve the element's identity from `elements`, its physical properties from `properties`, and its classification from `types`.

This reduces unnecessary duplication while keeping the data logically organized.

The project also demonstrated how command-line arguments can be passed from Bash into SQL queries, allowing one application command to search the database using multiple identifiers.

This helped reinforce how **database normalization, relational database design, SQL joins, Bash scripting, and command-line input can work together in a simple data retrieval application**.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements and starter database were provided by freeCodeCamp.
