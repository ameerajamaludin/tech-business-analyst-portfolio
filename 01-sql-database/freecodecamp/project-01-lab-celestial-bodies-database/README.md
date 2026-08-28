# Celestial Bodies Database

A PostgreSQL relational database project completed as part of the freeCodeCamp **Relational Databases** curriculum.

The project models a simplified universe containing galaxies, stars, planets, and moons. I completed the original project in freeCodeCamp and then recreated the database locally using PostgreSQL and VS Code to reinforce my understanding of relational database design, SQL constraints, foreign keys, and multi-table queries.

## Project Overview

The database is structured around the relationship:

```text
Galaxy
  │
  └── Star
        │
        └── Planet
              │
              └── Moon
```

A fifth table, `constellation`, was also created to meet the project requirements.

The main relationships are:

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

This means:

* a galaxy can contain multiple stars
* a star can have multiple planets
* a planet can have multiple moons

## Database Structure

### `galaxy`

Stores information about galaxies.

Key fields include:

* `galaxy_id` — Primary Key
* `name` — Unique galaxy name
* `description`
* `age_in_millions_of_years`
* `distance_from_earth`
* `is_spherical`

### `star`

Stores stars and connects each star to a galaxy.

Key fields include:

* `star_id` — Primary Key
* `name` — Unique star name
* `galaxy_id` — Foreign Key → `galaxy.galaxy_id`
* `age_in_millions_of_years`
* `temperature_kelvin`
* `is_spherical`

### `planet`

Stores planets and connects each planet to a star.

Key fields include:

* `planet_id` — Primary Key
* `name` — Unique planet name
* `star_id` — Foreign Key → `star.star_id`
* `orbital_period_days`
* `number_of_moons`
* `has_life`

### `moon`

Stores moons and connects each moon to a planet.

Key fields include:

* `moon_id` — Primary Key
* `name` — Unique moon name
* `planet_id` — Foreign Key → `planet.planet_id`
* `diameter_km`
* `is_spherical`
* `description`

### `constellation`

An additional table containing basic constellation information.

Key fields include:

* `constellation_id` — Primary Key
* `name` — Unique constellation name
* `abbreviation`

## Sample Data

The completed database contains:

| Table           | Records |
| --------------- | ------: |
| `galaxy`        |       6 |
| `star`          |       6 |
| `planet`        |      12 |
| `moon`          |      20 |
| `constellation` |       3 |

Example relationship:

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

## SQL Concepts Practiced

Through this project, I practiced:

* Creating PostgreSQL databases and tables
* Relational database design
* Primary keys
* Foreign keys
* One-to-many relationships
* `NOT NULL` constraints
* `UNIQUE` constraints
* Auto-incrementing IDs / sequences
* PostgreSQL data types including:

  * `INTEGER`
  * `VARCHAR`
  * `TEXT`
  * `NUMERIC`
  * `BOOLEAN`
* Inserting and querying relational data
* Joining multiple tables
* Sorting query results with `ORDER BY`
* Exporting and restoring PostgreSQL databases using `pg_dump` and `psql`

## Example: Multi-Table JOIN

One of the most useful exercises was querying information distributed across several related tables.

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

This answers the question:

> For each moon, which planet does it belong to, which star does that planet belong to, and which galaxy does that star belong to?

For example:

```text
Moon    → Earth   → Sun → Milky Way
Europa  → Jupiter → Sun → Milky Way
Phobos  → Mars    → Sun → Milky Way
Titan   → Saturn  → Sun → Milky Way
Triton  → Neptune → Sun → Milky Way
```

This helped me understand how foreign-key relationships can be followed across multiple tables to turn stored IDs into useful, human-readable information.

## Project File

```text
project-01-lab-celestial-bodies-database/
├── README.md
└── universe.sql
```

`universe.sql` is a PostgreSQL database dump containing the database schema, constraints, relationships, sequences, and sample data.

## Running Locally

### Prerequisites

* PostgreSQL
* `psql`

### Restore the database

From the project directory:

```bash
psql -U postgres < universe.sql
```

The dump was generated locally using:

```bash
pg_dump -cC --inserts -U postgres universe > universe.sql
```

> Note: freeCodeCamp's development environment uses the `freecodecamp` PostgreSQL user. This local version uses the default `postgres` user instead.

After restoring the database, connect using:

```bash
psql -U postgres -d universe
```

Then inspect the tables:

```sql
\dt
```

## What I Learned

The biggest takeaway from this project was understanding that relational databases are not just about storing information in separate tables — the relationships between those tables are what make the data useful.

For example, the `moon` table does not need to store the name of its planet, star, and galaxy. It only stores the `planet_id`. From there, the relationships can be followed:

```text
moon.planet_id
        ↓
planet.planet_id

planet.star_id
        ↓
star.star_id

star.galaxy_id
        ↓
galaxy.galaxy_id
```

Using `JOIN`, I can bring those relationships together when I actually need the information.

This project also helped reinforce the difference between primary keys and foreign keys, why foreign keys do not need to be unique, and how database constraints help maintain data integrity.

## Source

This project is based on the **Build a Celestial Bodies Database** lab from the freeCodeCamp Relational Databases curriculum.

* freeCodeCamp — Build a Celestial Bodies Database
* Recreated locally using PostgreSQL and VS Code

## Disclaimer

This repository is part of my personal learning portfolio. The project structure and requirements are based on freeCodeCamp's curriculum, while the local implementation, documentation, and learning notes reflect my own practice and understanding.
