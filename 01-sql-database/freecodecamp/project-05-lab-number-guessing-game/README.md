# Number Guessing Game

A command-line number guessing game built with **Bash, PostgreSQL, and SQL** as part of the [freeCodeCamp Relational Database Certification](https://www.freecodecamp.org/learn/relational-databases-v9/lab-number-guessing-game/lab-number-guessing-game).

The application generates a random number between **1 and 1000** and challenges the player to guess it. Player information and game statistics are stored in PostgreSQL, allowing returning users to view their previous game count and best score.

## Project Overview

The goal of this project was to combine Bash scripting, PostgreSQL, and Git while building an interactive command-line application.

The project involves:

* Generating random numbers with Bash
* Reading and validating user input
* Implementing a game loop
* Providing higher/lower feedback
* Tracking the number of guesses
* Creating and retrieving users from PostgreSQL
* Storing completed game results
* Calculating player statistics using SQL
* Maintaining persistent data between game sessions

## Database Structure

The database contains two main tables:

### `users`

Stores registered players.

| Column     | Description                                       |
| ---------- | ------------------------------------------------- |
| `user_id`  | Primary key and unique identifier for each player |
| `username` | Player's username                                 |

### `games`

Stores completed game results.

| Column              | Description                                     |
| ------------------- | ----------------------------------------------- |
| `game_id`           | Primary key and unique identifier for each game |
| `user_id`           | Foreign key referencing the player              |
| `number_of_guesses` | Number of guesses required to complete the game |

## Database Relationship

```text
users
└── user_id (PK)
        │
        └────< games.user_id (FK)
```

A single user can play multiple games, while each game belongs to one user.

This allows the application to maintain a history of completed games for every player.

## How It Works

When `number_guess.sh` is executed, the application follows this flow:

1. Prompts the player for a username.
2. Searches the database for an existing user.
3. Creates a new user if the username is not found.
4. For returning users, retrieves:

   * Total number of games played
   * Best game based on the fewest guesses
5. Generates a random secret number between 1 and 1000.
6. Prompts the player to guess the number.
7. Validates that each guess is an integer.
8. Tells the player whether the secret number is higher or lower.
9. Continues until the correct number is guessed.
10. Records the number of guesses in PostgreSQL.
11. Displays the final game result.

## New Player

When a username is not found in the database, a new player record is created.

Example:

```text
Enter your username:
player1

Welcome, player1! It looks like this is your first time here.
```

The application then starts a new game for the player.

## Returning Player

If the username already exists, the application retrieves the player's previous statistics.

Example:

```text
Enter your username:
player1

Welcome back, player1! You have played 5 games, and your best game took 7 guesses.
```

The number of games is calculated using `COUNT()` and the player's best score is determined using `MIN()`.

## Gameplay

The application generates a random number between 1 and 1000:

```bash
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
```

The player is then prompted to guess:

```text
Guess the secret number between 1 and 1000:
```

If the guess is too high:

```text
It's lower than that, guess again:
```

If the guess is too low:

```text
It's higher than that, guess again:
```

The loop continues until the player guesses the secret number.

## Input Validation

The game checks whether each guess is a valid integer.

For example:

```text
Guess the secret number between 1 and 1000:
hello

That is not an integer, guess again:
```

The validation is handled using a Bash regular expression:

```bash
if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
```

Invalid input does not stop the program. Instead, the player is prompted to guess again.

## Game Statistics

The application uses PostgreSQL to maintain player statistics.

### Games Played

```sql
SELECT COUNT(*)
FROM games
WHERE user_id = USER_ID;
```

This determines how many games a returning player has completed.

### Best Game

```sql
SELECT MIN(number_of_guesses)
FROM games
WHERE user_id = USER_ID;
```

Since a lower number of guesses represents a better result, `MIN()` identifies the player's best game.

## Saving Game Results

Once the correct number is guessed, the result is stored in the `games` table.

Conceptually:

```sql
INSERT INTO games(user_id, number_of_guesses)
VALUES(USER_ID, NUMBER_OF_GUESSES);
```

The player then receives a final confirmation:

```text
You guessed it in 8 tries. The secret number was 427. Nice job!
```

Because the result is stored in PostgreSQL, it contributes to the player's statistics the next time they play.

## Technologies

* PostgreSQL
* SQL
* Bash
* Git
* GitHub

## Project Files

```text
number-guessing-game/
├── number_guess.sh
├── number_guess.sql
└── README.md
```

### `number_guess.sh`

Contains the command-line game logic, including:

* Username input
* User lookup and registration
* Player statistics
* Random number generation
* Guess validation
* Higher/lower feedback
* Guess counting
* Game result storage

### `number_guess.sql`

PostgreSQL database dump containing the database schema, tables, relationships, constraints, and stored game data.

## What I Learned

Through this project, I practiced:

* Connecting Bash scripts to PostgreSQL
* Executing SQL queries from Bash
* Creating and retrieving database records
* Designing one-to-many database relationships
* Using primary and foreign keys
* Using SQL aggregate functions such as `COUNT()` and `MIN()`
* Persisting application data between sessions
* Generating random numbers in Bash
* Reading command-line input
* Using Bash `if` / `elif` / `else` conditions
* Using `while` loops
* Validating input with regular expressions
* Comparing numeric values in Bash
* Tracking application state with variables
* Building an interactive command-line application
* Using Git to track project changes

## Key Takeaway

This project demonstrates how a relational database can add **persistent user data and statistics** to an otherwise temporary command-line application.

The Bash script handles the game logic and user interaction, while PostgreSQL maintains player identities and completed game results.

By connecting each game to a user through a foreign key, the application can calculate statistics such as total games played and the player's best performance across multiple sessions.

This helped reinforce how **application logic, persistent data, relational database design, and SQL queries work together in a complete application**.

## Acknowledgements

Project completed as part of freeCodeCamp's **Relational Database** curriculum.

The project requirements were provided by freeCodeCamp.
