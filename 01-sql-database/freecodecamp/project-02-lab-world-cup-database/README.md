# World Cup Database

A PostgreSQL relational database project completed as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-world-cup-database/lab-world-cup-database).

The project stores World Cup knockout-stage match data, imports the dataset automatically using a Bash script, and uses SQL queries to analyse tournament results.

## Project Overview

The goal of this project was to practice designing and working with a relational PostgreSQL database while using Bash to automate data import and execute SQL queries.

The project involves:

* Designing a relational database for World Cup teams and matches
* Defining primary and foreign key relationships
* Importing CSV data using Bash and PostgreSQL
* Preventing duplicate team records during data import
* Querying tournament data using SQL
* Using SQL aggregate functions
* Filtering and sorting query results
* Joining related tables
* Searching text using pattern matching

## Database Structure

The database contains two tables:

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

## Database Relationships

The `teams` table is connected to the `games` table through two foreign keys:

```text
teams
 └── team_id (PK)
      │
      ├──────────────< games.winner_id (FK)
      │
      └──────────────< games.opponent_id (FK)
```

Both `winner_id` and `opponent_id` reference `teams.team_id`.

This allows each team to be stored once in the `teams` table while multiple games can reference the same team as either the winner or opponent.

## Data Import

The `insert_data.sh` Bash script reads World Cup match data from `games.csv` and inserts it into PostgreSQL.

For each match, the script:

1. Reads the tournament year, round, teams, and scores.
2. Checks whether the winning team already exists.
3. Inserts the winning team if it does not exist.
4. Checks whether the opponent already exists.
5. Inserts the opponent if it does not exist.
6. Retrieves the corresponding team IDs.
7. Inserts the match into the `games` table.

This keeps team data normalized and prevents duplicate team records from being created during the import process.

The import workflow can be represented as:

```text
games.csv
    │
    ↓
insert_data.sh
    │
    ├── Check / insert teams
    │
    └── Insert games
            │
            ↓
       PostgreSQL
```

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

## SQL Example: Tournament Champions

One query combines the `games` and `teams` tables to retrieve the champion for each tournament year:

```sql
SELECT year, name
FROM games
INNER JOIN teams
ON games.winner_id = teams.team_id
WHERE round = 'Final'
ORDER BY year;
```

The query works by:

1. Selecting the tournament `year` from `games`.
2. Joining each game's `winner_id` to the corresponding record in `teams`.
3. Filtering the results to matches where the round is `Final`.
4. Sorting the tournament champions by year.

This demonstrates how foreign keys can be combined with SQL joins to retrieve human-readable information from normalized relational data.

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
* Defining primary and foreign keys
* Applying `NOT NULL` and `UNIQUE` constraints
* Creating one-to-many relationships
* Importing structured data from CSV files
* Combining Bash scripts with PostgreSQL commands
* Preventing duplicate records during data import
* Using SQL aggregate functions such as `SUM()`, `AVG()`, `MAX()`, and `COUNT()`
* Joining related tables with `INNER JOIN`
* Filtering records with `WHERE`
* Removing duplicate query results with `DISTINCT`
* Sorting query results with `ORDER BY`
* Searching text patterns using `LIKE`

## Key Takeaway

The main lesson from this project was understanding how a normalized relational database can separate reusable entity data from transactional data.

Instead of repeatedly storing team names in every World Cup match record, each team is stored once in the `teams` table.

The `games` table then references those records using foreign keys:

```text
games.winner_id
        ↓
teams.team_id

games.opponent_id
        ↓
teams.team_id
```

This reduces unnecessary duplication while maintaining the relationships needed to determine which teams participated in each match.

The project also demonstrated how Bash can be used alongside PostgreSQL to automate data processing. The CSV dataset is read by `insert_data.sh`, transformed into relational records, and stored in PostgreSQL, while `queries.sh` retrieves and analyses the resulting data.

This helped reinforce how **relational database design, data import automation, Bash scripting, and SQL analysis can work together in a complete data workflow**.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements and starter dataset were provided by freeCodeCamp.
