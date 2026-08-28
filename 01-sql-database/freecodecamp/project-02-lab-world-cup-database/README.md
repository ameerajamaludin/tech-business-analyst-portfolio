# World Cup Database

A PostgreSQL relational database project built as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-world-cup-database/lab-world-cup-database).

The project stores World Cup knockout-stage match data, imports the dataset automatically using a Bash script, and uses SQL queries to analyse tournament results.

## Project Overview

The goal of this project was to practice building and working with a relational PostgreSQL database.

The project involves:

* Designing a relational database for World Cup teams and matches
* Defining primary and foreign key relationships
* Importing CSV data using Bash and PostgreSQL
* Preventing duplicate team records during data import
* Querying tournament data using SQL
* Using aggregate functions, filtering, joins, sorting, and pattern matching

## Database Structure

The database contains two main tables:

### `teams`

Stores each unique national team.

| Column    | Description                                     |
| --------- | ----------------------------------------------- |
| `team_id` | Primary key and unique identifier for each team |
| `name`    | Unique team name                                |

### `games`

Stores information about each World Cup match.

| Column           | Description                                     |
| ---------------- | ----------------------------------------------- |
| `game_id`        | Primary key and unique identifier for each game |
| `year`           | Tournament year                                 |
| `round`          | Tournament round                                |
| `winner_id`      | Foreign key referencing the winning team        |
| `opponent_id`    | Foreign key referencing the opposing team       |
| `winner_goals`   | Goals scored by the winning team                |
| `opponent_goals` | Goals scored by the opposing team               |

### Relationships

```text
teams
 ├── team_id (PK)
 │
 ├──────────────< games.winner_id
 │
 └──────────────< games.opponent_id
```

Both `winner_id` and `opponent_id` reference `teams.team_id`, allowing team information to be stored once while multiple games can reference the same team.

## Data Import

The `insert_data.sh` Bash script reads match data from `games.csv` and inserts it into PostgreSQL.

For each match, the script:

1. Reads the tournament year, round, teams, and scores.
2. Checks whether the winning team already exists.
3. Inserts the team if it does not exist.
4. Checks whether the opponent already exists.
5. Inserts the opponent if necessary.
6. Retrieves the corresponding team IDs.
7. Inserts the match into the `games` table.

This keeps team data normalized and prevents duplicate team records.

## SQL Analysis

The `queries.sh` script contains SQL queries used to analyse the World Cup dataset.

The analysis includes:

* Total goals scored by winning teams
* Total goals scored by all teams
* Average goals scored by winning teams
* Average goals per match
* Maximum goals scored by one team in a match
* Number of games where the winner scored more than two goals
* Tournament winner for 2018
* Teams that participated in a specific tournament round
* Unique winning teams
* Tournament champions by year
* Teams matching a name pattern

Example:

```sql
SELECT year, name
FROM games
INNER JOIN teams
ON games.winner_id = teams.team_id
WHERE round = 'Final'
ORDER BY year;
```

This query combines the `games` and `teams` tables to retrieve the champion for each tournament year.

## Technologies

* PostgreSQL
* SQL
* Bash
* CSV
* Git
* GitHub

## Project Files

```text
world-cup-database/
├── games.csv
├── insert_data.sh
├── queries.sh
├── worldcup.sql
└── README.md
```

### `games.csv`

Contains the World Cup match dataset used by the project.

### `insert_data.sh`

Reads the CSV dataset and populates the PostgreSQL database.

### `queries.sh`

Runs SQL queries against the database to retrieve and analyse tournament statistics.

### `worldcup.sql`

PostgreSQL database dump containing the database schema, constraints, relationships, and stored data.

## What I Learned

Through this project, I practiced:

* Creating PostgreSQL databases and tables
* Designing relational database structures
* Using primary and foreign keys
* Applying `NOT NULL` and `UNIQUE` constraints
* Understanding one-to-many relationships
* Importing structured data from CSV files
* Combining Bash scripts with PostgreSQL commands
* Using SQL aggregate functions such as `SUM()`, `AVG()`, `MAX()`, and `COUNT()`
* Joining related tables with `INNER JOIN`
* Filtering data with `WHERE`
* Removing duplicate query results with `DISTINCT`
* Sorting results with `ORDER BY`
* Searching text patterns using `LIKE`

## Key Takeaway

The main lesson from this project was understanding how a normalized relational database separates entities such as teams from transactional data such as matches.

Instead of repeatedly storing team names in every match record, the `games` table references records in the `teams` table through foreign keys. This reduces duplication and provides a structured foundation for querying and analysing the dataset.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements and starter dataset were provided by freeCodeCamp.
