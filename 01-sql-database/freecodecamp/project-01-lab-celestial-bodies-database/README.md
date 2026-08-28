# Celestial Bodies Database

A PostgreSQL relational database project completed as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-celestial-bodies-database/lab-celestial-bodies-database).

The project models a simplified universe containing galaxies, stars, planets, moons, and constellations. I completed the original project in freeCodeCamp and then recreated the database locally using PostgreSQL and VS Code to reinforce my understanding of relational database design, SQL constraints, foreign keys, and multi-table queries.

## Project Overview

The goal of this project was to practice designing and working with a relational PostgreSQL database containing multiple connected entities.

The project involves:

* Creating a PostgreSQL database and multiple related tables
* Defining primary and foreign key relationships
* Creating one-to-many relationships between tables
* Applying `NOT NULL` and `UNIQUE` constraints
* Working with PostgreSQL data types
* Inserting and querying relational data
* Joining multiple related tables
* Sorting query results
* Exporting and restoring a PostgreSQL database

## Database Structure

The database contains five tables:

### `galaxy`

Stores information about galaxies.

| Column                     | Description                          |
| -------------------------- | ------------------------------------ |
| `galaxy_id`                | Primary key and unique identifier    |
| `name`                     | Unique galaxy name                   |
| `description`              | Description of the galaxy            |
| `age_in_millions_of_years` | Approximate age in millions of years |
| `distance_from_earth`      | Distance from Earth                  |
| `is_spherical`             | Indicates whether it is spherical    |

### `star`

Stores stars and connects each star to a galaxy.

| Column                     | Description                             |
| -------------------------- | --------------------------------------- |
| `star_id`                  | Primary key and unique identifier       |
| `name`                     | Unique star name                        |
| `galaxy_id`                | Foreign key referencing `galaxy`        |
| `age_in_millions_of_years` | Approximate age in millions of years    |
| `temperature_kelvin`       | Temperature measured in Kelvin          |
| `is_spherical`             | Indicates whether the star is spherical |

### `planet`

Stores planets and connects each planet to a star.

| Column                | Description                                |
| --------------------- | ------------------------------------------ |
| `planet_id`           | Primary key and unique identifier          |
| `name`                | Unique planet name                         |
| `star_id`             | Foreign key referencing `star`             |
| `orbital_period_days` | Orbital period measured in days            |
| `number_of_moons`     | Number of moons associated with the planet |
| `has_life`            | Indicates whether the planet has life      |

### `moon`

Stores moons and connects each moon to a planet.

| Column         | Description                             |
| -------------- | --------------------------------------- |
| `moon_id`      | Primary key and unique identifier       |
| `name`         | Unique moon name                        |
| `planet_id`    | Foreign key referencing `planet`        |
| `diameter_km`  | Diameter measured in kilometres         |
| `is_spherical` | Indicates whether the moon is spherical |
| `description`  | Description of the moon                 |

### `constellation`

Stores basic information about constellations.

| Column             | Description                             |
| ------------------ | --------------------------------------- |
| `constellation_id` | Primary key and unique identifier       |
| `name`             | Unique constellation name               |
| `abbreviation`     | Abbreviation used for the constellation |

## Database Relationships

The primary hierarchy of the database is:

```text
Galaxy
  │
  └── Star
        │
        └── Planet
              │
              └── Moon
```

The corresponding foreign key relationships are:

```text
galaxy.galaxy_id
        ↑
        │
star.galaxy_id

star.star_id
        ↑
        │
planet.star_id

planet.planet_id
        ↑
        │
moon.planet_id
```

This creates several one-to-many relationships:

* A galaxy can contain multiple stars.
* A star can have multiple planets.
* A planet can have multiple moons.

The `constellation` table is an additional table created to meet the project requirements.

## Sample Data

The completed database contains:

| Table           | Records |
| --------------- | ------: |
| `galaxy`        |       6 |
| `star`          |       6 |
| `planet`        |      12 |
| `moon`          |      20 |
| `constellation` |       3 |

An example of the relationships represented by the sample data is:

```text
Milky Way
└── Sun
    ├── Earth
    │   └── Moon
    ├── Mars
    │   ├── Phobos
    │   └── Deimos
    ├── Jupiter
    │   ├── Io
    │   ├── Europa
    │   ├── Ganymede
    │   └── ...
    └── Saturn
        ├── Titan
        ├── Rhea
        └── ...
```

## SQL Example: Multi-Table JOIN

One of the most useful exercises in this project was querying information distributed across several related tables.

For example:

```sql
SELECT
    moon.name AS moon,
    planet.name AS planet,
    star.name AS star,
    galaxy.name AS galaxy
FROM moon
JOIN planet
    ON moon.planet_id = planet.planet_id
JOIN star
    ON planet.star_id = star.star_id
JOIN galaxy
    ON star.galaxy_id = galaxy.galaxy_id
ORDER BY galaxy.name, star.name, planet.name, moon.name;
```

This query answers the question:

> For each moon, which planet does it belong to, which star does that planet belong to, and which galaxy does that star belong to?

Example relationships returned by the query include:

```text
Moon    → Earth   → Sun → Milky Way
Europa  → Jupiter → Sun → Milky Way
Phobos  → Mars    → Sun → Milky Way
Titan   → Saturn  → Sun → Milky Way
Triton  → Neptune → Sun → Milky Way
```

This demonstrates how foreign key relationships can be followed across multiple tables to transform stored identifiers into useful, human-readable information.

## Technologies

* PostgreSQL
* SQL
* `psql`
* `pg_dump`
* Git
* GitHub
* VS Code

## Project Files

```text
celestial-bodies-database/
├── universe.sql
└── README.md
```

### `universe.sql`

PostgreSQL database dump containing the database schema, constraints, relationships, sequences, and sample data.

## Running Locally

### Prerequisites

* PostgreSQL
* `psql`

### Restore the Database

From the project directory, restore the database using:

```bash
psql -U postgres < universe.sql
```

The database dump was generated locally using:

```bash
pg_dump -cC --inserts -U postgres universe > universe.sql
```

> **Note:** freeCodeCamp's development environment uses the `freecodecamp` PostgreSQL user. This local version uses the default `postgres` user instead.

### Connect to the Database

After restoring the database, connect using:

```bash
psql -U postgres -d universe
```

Then inspect the available tables:

```sql
\dt
```

## What I Learned

Through this project, I practiced:

* Creating PostgreSQL databases and tables
* Designing relational database structures
* Defining primary and foreign keys
* Creating one-to-many relationships
* Applying `NOT NULL` and `UNIQUE` constraints
* Working with auto-incrementing IDs and sequences
* Using PostgreSQL data types including `INTEGER`, `VARCHAR`, `TEXT`, `NUMERIC`, and `BOOLEAN`
* Inserting and querying relational data
* Joining related tables with SQL `JOIN`
* Following foreign key relationships across multiple tables
* Sorting query results with `ORDER BY`
* Exporting and restoring PostgreSQL databases using `pg_dump` and `psql`

## Key Takeaway

The main lesson from this project was understanding that relational databases are not just about storing information in separate tables — the relationships between those tables are what make the data useful.

For example, the `moon` table does not need to store the name of its planet, star, and galaxy. It only needs to reference its associated planet through `planet_id`.

The relationships can then be followed through the database:

```text
moon.planet_id
        ↓
planet.planet_id
        │
        └── planet.star_id
                    ↓
              star.star_id
                    │
                    └── star.galaxy_id
                                ↓
                        galaxy.galaxy_id
```

Using SQL joins, these relationships can be combined whenever the information is needed.

This project reinforced the difference between primary and foreign keys, why foreign keys do not need to be unique, how one-to-many relationships work, and how database constraints help maintain data integrity.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements were provided by freeCodeCamp. The database was later recreated locally using PostgreSQL and VS Code as part of my personal learning portfolio.
