# Relational Database Notes

This file consolidates my notes from the workshops completed as part of freeCodeCamp's **Relational Database Certification**.

The workshops covered Bash and the Linux terminal, PostgreSQL, SQL, relational database design, Bash scripting, text processing, Nano, and Git.

## 1. Bash and the Linux Terminal

### Navigation and Inspection

```bash
pwd
ls
ls -l
ls -a

cd directory
cd ..

more file.txt
clear
```

| Command | Purpose                             |
| ------- | ----------------------------------- |
| `pwd`   | Print the current working directory |
| `ls`    | List files and directories          |
| `ls -l` | Show a detailed listing             |
| `ls -a` | Include hidden files                |
| `cd`    | Change directory                    |
| `cd ..` | Move to the parent directory        |
| `more`  | View a file one screen at a time    |
| `clear` | Clear the terminal                  |

### Managing Files and Directories

```bash
touch file.txt
mkdir directory

cp source.txt copy.txt
mv old.txt new.txt

rm file.txt
rmdir empty-directory
rm -r directory
```

`mv` can be used both to move and rename files.

Recursive removal with `rm -r` removes a directory and its contents, so it should be used carefully.

### Getting Help

```bash
help
ls --help
rm --help
```

Command help is useful for checking available flags and expected syntax before running an unfamiliar command.

---

## 2. Standard Input, Output, and Redirection

Linux commands communicate through standard streams:

| Stream | File Descriptor | Purpose       |
| ------ | --------------: | ------------- |
| stdin  |             `0` | Input         |
| stdout |             `1` | Normal output |
| stderr |             `2` | Error output  |

### Redirecting Output

```bash
echo "hello" > output.txt
echo "another line" >> output.txt
bad_command 2> errors.txt
```

| Operator | Purpose                                       |
| -------- | --------------------------------------------- |
| `>`      | Redirect stdout and overwrite the destination |
| `>>`     | Redirect stdout and append                    |
| `2>`     | Redirect stderr                               |
| `<`      | Read stdin from a file                        |
| `\|`     | Pass stdout to another command                |

Example:

```bash
./translate.sh < kitty_ipsum_1.txt > doggy_1.txt
```

This uses one file as the script's input and writes the resulting stdout to another file.

### Pipes

A pipe connects the output of one command to the input of another.

```bash
cat file.txt | grep "cat"
```

Commands can therefore be combined into small processing pipelines without creating an intermediate file.

---

# 3. Bash Scripting

## Script Basics

A Bash script starts with a shebang:

```bash
#!/bin/bash
```

Make it executable:

```bash
chmod +x script.sh
```

Run it:

```bash
./script.sh
```

## Variables

```bash
NAME="Ameera"
echo "$NAME"
```

Access a variable by prefixing its name with `$`.

## User Input

```bash
read NAME
echo "Hello $NAME"
```

`read` stores user input in a variable.

## Script Arguments

```bash
./countdown.sh 5
```

Inside the script:

```bash
$1
$2
$*
$?
```

| Syntax | Meaning                             |
| ------ | ----------------------------------- |
| `$1`   | First argument                      |
| `$2`   | Second argument                     |
| `$*`   | All arguments                       |
| `$?`   | Exit status of the previous command |

An exit status of `0` normally indicates success.

## Conditional Logic

```bash
if [[ $1 =~ ^[0-9]+$ ]]
then
  echo "Valid number"
else
  echo "Invalid number"
fi
```

Useful tests include:

```text
==
!=
-ne
-le
-ge
-z
-a
-x
=~
```

`[[ ... ]]` evaluates tests and regular expressions.

## Arithmetic

Arithmetic expressions can use double parentheses:

```bash
NUMBER=$(( RANDOM % 75 + 1 ))
```

`$RANDOM` provides a pseudo-random integer.

## Loops

### for

```bash
for (( i=5; i>=0; i-- ))
do
  echo "$i"
done
```

### while

```bash
while [[ condition ]]
do
  # commands
done
```

### until

```bash
until [[ condition ]]
do
  # commands
done
```

## Functions

```bash
GET_FORTUNE() {
  echo "${RESPONSES[$1]}"
}
```

Functions group reusable behavior and can receive positional arguments in the same way as scripts.

## Arrays

```bash
RESPONSES=("Yes" "No" "Maybe")

echo "${RESPONSES[0]}"
echo "${RESPONSES[@]}"
```

Arrays are useful when a script needs to store multiple related values.

---

# 4. PostgreSQL Basics

## Connecting to PostgreSQL

```bash
psql --username=freecodecamp --dbname=postgres
```

Useful `psql` commands:

| Command            | Purpose               |
| ------------------ | --------------------- |
| `\l`               | List databases        |
| `\c database_name` | Connect to a database |
| `\d`               | List relations/tables |
| `\d table_name`    | Inspect a table       |

## Creating a Database

```sql
CREATE DATABASE mario_database;
```

## Creating Tables

```sql
CREATE TABLE characters();
```

Columns can be added later:

```sql
ALTER TABLE characters
ADD COLUMN character_id SERIAL PRIMARY KEY;
```

```sql
ALTER TABLE characters
ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL;
```

## Common Data Types

| Type         | Purpose                   |
| ------------ | ------------------------- |
| `INT`        | Integer                   |
| `SERIAL`     | Auto-incrementing integer |
| `VARCHAR(n)` | Variable-length text      |
| `TEXT`       | Text                      |
| `NUMERIC`    | Exact numeric value       |
| `DATE`       | Date                      |
| `BOOLEAN`    | True/false value          |

---

# 5. Relational Database Design

A relational database separates different types of information into tables and connects them using keys.

## Primary Keys

A primary key uniquely identifies each row.

```sql
character_id SERIAL PRIMARY KEY
```

## Foreign Keys

A foreign key references a row in another table.

```sql
ALTER TABLE more_info
ADD FOREIGN KEY(character_id)
REFERENCES characters(character_id);
```

## Constraints

Common constraints include:

| Constraint    | Purpose                  |
| ------------- | ------------------------ |
| `PRIMARY KEY` | Uniquely identify a row  |
| `FOREIGN KEY` | Reference another table  |
| `UNIQUE`      | Prevent duplicate values |
| `NOT NULL`    | Require a value          |

## Relationships

### One-to-One

One row corresponds to one row in another table.

Example:

```text
characters ─── more_info
```

### One-to-Many

One parent can have multiple child records.

Example:

```text
characters ───< sounds
```

### Many-to-Many

A junction table connects two tables.

```text
characters
     │
     ▼
character_actions
     ▲
     │
actions
```

A composite primary key can prevent the same relationship from being inserted twice:

```sql
PRIMARY KEY(character_id, action_id)
```

---

# 6. CRUD Operations

CRUD represents the core operations performed on stored data:

```text
Create
Read
Update
Delete
```

## INSERT

```sql
INSERT INTO characters(name, homeland, favorite_color)
VALUES ('Mario', 'Mushroom Kingdom', 'Red');
```

## SELECT

```sql
SELECT character_id, name
FROM characters;
```

## UPDATE

```sql
UPDATE characters
SET favorite_color = 'Yellow'
WHERE name = 'Bowser';
```

## DELETE

```sql
DELETE FROM characters
WHERE name = 'Samus';
```

`WHERE` is especially important with `UPDATE` and `DELETE` because it determines which rows are changed.

---

# 7. Querying and Filtering Data

## WHERE

```sql
SELECT first_name, last_name, gpa
FROM students
WHERE gpa >= 3.8;
```

Comparison operators include:

```text
=
!=
<
>
<=
>=
```

Conditions can be combined using:

```sql
AND
OR
```

Missing values can be tested with:

```sql
IS NULL
IS NOT NULL
```

## Pattern Matching

```sql
SELECT course
FROM courses
WHERE course LIKE 'Web%';
```

```sql
SELECT course
FROM courses
WHERE course ILIKE '%a%';
```

| Syntax  | Meaning                           |
| ------- | --------------------------------- |
| `%`     | Match zero or more characters     |
| `_`     | Match one character               |
| `LIKE`  | Pattern matching                  |
| `ILIKE` | Case-insensitive pattern matching |

## Ordering Results

```sql
SELECT first_name, last_name, gpa
FROM students
ORDER BY gpa DESC, first_name;
```

## Limiting Results

```sql
SELECT *
FROM students
LIMIT 10;
```

---

# 8. Aggregate Queries

Aggregate functions summarize multiple rows.

| Function   | Purpose               |
| ---------- | --------------------- |
| `COUNT`    | Count rows or values  |
| `MIN`      | Find the minimum      |
| `MAX`      | Find the maximum      |
| `SUM`      | Calculate a total     |
| `AVG`      | Calculate an average  |
| `ROUND`    | Round a numeric value |
| `CEIL`     | Round upward          |
| `DISTINCT` | Return unique values  |

## GROUP BY

```sql
SELECT major_id, COUNT(*) AS number_of_students
FROM students
GROUP BY major_id;
```

`GROUP BY` changes the level at which an aggregate is calculated.

## HAVING

```sql
SELECT major_id, COUNT(*)
FROM students
GROUP BY major_id
HAVING COUNT(*) > 1;
```

A useful distinction:

```text
WHERE  → filters rows
HAVING → filters groups
```

---

# 9. SQL Joins

Joins combine related rows from multiple tables.

| Join         | Result                    |
| ------------ | ------------------------- |
| `INNER JOIN` | Matching rows only        |
| `LEFT JOIN`  | All left rows + matches   |
| `RIGHT JOIN` | All right rows + matches  |
| `FULL JOIN`  | All rows from both tables |

Example:

```sql
SELECT first_name, last_name, major
FROM students
LEFT JOIN majors USING(major_id);
```

`USING(major_id)` is convenient when both tables use the same column name for the relationship.

Multiple joins can follow a relationship across several tables:

```text
students
    │
    ▼
majors
    │
    ▼
majors_courses
    │
    ▼
courses
```

---

# 10. Importing CSV Data with Bash and PostgreSQL

The Student Database workshop combined Bash and SQL to populate PostgreSQL from:

```text
courses.csv
students.csv
```

## Reading CSV Rows

```bash
cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo "$MAJOR"
  echo "$COURSE"
done
```

`IFS=","` tells Bash to split each input row at commas.

## Running PostgreSQL from Bash

```bash
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
```

Then:

```bash
$PSQL "SELECT * FROM majors;"
```

## Command Substitution

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

`$()` executes the command and stores its output.

## Conditional Inserts

```bash
if [[ -z $MAJOR_ID ]]
then
  INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
fi
```

This allows an import script to check whether a record already exists before inserting it.

## Handling NULL

SQL `NULL` represents a missing or unknown value.

```sql
NULL
```

It is different from:

```sql
'NULL'
```

because the quoted version is ordinary text.

---

# 11. Bash and PostgreSQL Applications

The Bike Rental Shop combined Bash program flow with persistent PostgreSQL data.

The database used:

```text
bikes
customers
rentals
```

The script was organized into functions:

```text
MAIN_MENU
├── RENT_MENU
├── RETURN_MENU
└── EXIT
```

## Querying from Bash

```bash
AVAILABLE_BIKES=$(
  $PSQL "SELECT bike_id, type, size
         FROM bikes
         WHERE available = true
         ORDER BY bike_id"
)
```

## Renting

The rental flow:

1. Query available bikes.
2. Validate the selected bike.
3. Look up the customer.
4. Insert the customer if needed.
5. Create the rental.
6. Mark the bike unavailable.

```sql
INSERT INTO rentals(customer_id, bike_id)
VALUES(1, 3);

UPDATE bikes
SET available = false
WHERE bike_id = 3;
```

## Returning

Returning a bike updates both the rental and inventory state:

```sql
UPDATE rentals
SET date_returned = NOW()
WHERE rental_id = 7;

UPDATE bikes
SET available = true
WHERE bike_id = 3;
```

This demonstrated how application logic and database state need to remain consistent.

---

# 12. Text Processing

## wc

```bash
wc -l < file.txt
wc -w < file.txt
wc -m < file.txt
```

| Flag | Count      |
| ---- | ---------- |
| `-l` | Lines      |
| `-w` | Words      |
| `-m` | Characters |

## grep

```bash
grep -o 'cat[a-z]*' kitty_ipsum_1.txt
grep -n 'meow[a-z]*' kitty_ipsum_2.txt
```

| Flag | Purpose                          |
| ---- | -------------------------------- |
| `-o` | Print matching fragments         |
| `-n` | Include line numbers             |
| `-E` | Use extended regular expressions |

## sed

```bash
sed -E 's/cat|catnip/dog/g'
```

`sed` can transform text using substitutions.

The `g` flag replaces every matching occurrence on a line.

## diff

```bash
diff --color original.txt translated.txt
```

`diff` compares files and highlights their differences.

---

# 13. Nano

Nano is a terminal-based text editor.

```bash
nano castle.sh
```

## Common Shortcuts

| Shortcut   | Action           |
| ---------- | ---------------- |
| `Ctrl + O` | Save / write out |
| `Enter`    | Confirm filename |
| `Ctrl + X` | Exit             |
| `Ctrl + K` | Cut current line |
| `Ctrl + U` | Uncut / paste    |

Nano represents Ctrl with:

```text
^
```

and Meta with:

```text
M-
```

A useful workflow is:

```text
Edit → Save → Exit → Run → Inspect → Edit again
```

---

# 14. Git Fundamentals

## Initialize a Repository

```bash
git init
```

## Check Repository State

```bash
git status
```

Git distinguishes between:

```text
Working tree
     ↓
Staging area
     ↓
Commit history
```

## Inspect Changes

```bash
git diff
```

## Stage Changes

```bash
git add file.txt
```

## Commit

```bash
git commit -m "feat: add feature"
```

---

# 15. Git Branches and Merges

## Create a Branch

```bash
git checkout -b feat/add-feature
```

## List Branches

```bash
git branch
```

## Switch Branch

```bash
git checkout main
```

## Merge

```bash
git merge feat/add-feature
```

## Delete a Branch

```bash
git branch -d feat/add-feature
```

Branches isolate work until it is ready to be integrated.

---

# 16. Inspecting Git History

```bash
git log --oneline
git show HEAD~1
```

`git log` displays commit history, while `git show` displays a particular commit and its changes.

---

# 17. Git Stash

Stashing temporarily stores unfinished changes.

```bash
git stash
git stash list
git stash show -p
git stash pop
```

Useful operations include:

| Command           | Purpose                         |
| ----------------- | ------------------------------- |
| `git stash`       | Save current unfinished changes |
| `git stash list`  | List stashes                    |
| `git stash apply` | Restore without deleting stash  |
| `git stash pop`   | Restore and remove stash        |
| `git stash drop`  | Delete a stash                  |

---

# 18. Git Rebase and Squash

```bash
git rebase main
```

A rebase replays commits on top of another base.

Interactive rebase:

```bash
git rebase -i HEAD~5
```

can be used to clean local history, including rewording or squashing commits.

After resolving a rebase conflict:

```bash
git add resolved-file
git rebase --continue
```

This is the same workflow used when a rebase stops because two commits changed the same part of a file.

---

# 19. Undoing Git Changes

## Reset

```bash
git reset HEAD~1
```

`reset` can move the current branch pointer backward and is useful when editing local history.

## Revert

```bash
git revert HEAD
```

`revert` creates a new commit that reverses an earlier commit.

A useful distinction:

```text
reset  → rewrites/moves local history
revert → adds a new commit that undoes an old one
```

---

# 20. `.gitignore` and Secrets

Files that should not be tracked can be listed in:

```text
.gitignore
```

For example:

```text
.env
```

A safe pattern is:

```text
.env         → local values/secrets; ignored
sample.env   → example variable names; committed
```

This prevents local secrets from accidentally becoming part of repository history.

---

# 21. SQL Reference

The Git workshop also used a JSON object as a reusable SQL command reference.

```json
{
  "database": {
    "create": "CREATE DATABASE database_name;",
    "drop": "DROP DATABASE database_name;"
  },
  "table": {
    "create": "CREATE TABLE table_name();"
  }
}
```

This reinforced SQL commands while Git was used to track each change to the reference.

---

# Key Takeaways

Across the workshops, I learned how the tools fit together rather than treating them as isolated topics:

* **Bash** provides command-line navigation, scripting, automation, validation, and program flow.
* **PostgreSQL** stores structured and persistent application data.
* **SQL** defines, modifies, queries, aggregates, and connects relational data.
* **Primary and foreign keys** define relationships and protect relational integrity.
* **Bash + SQL** can automate imports, reports, and interactive database-backed programs.
* **Unix text tools** such as `grep`, `sed`, and `wc` can be connected through pipes and redirection.
* **Nano** provides a lightweight terminal editing workflow.
* **Git** tracks changes and provides branching, merging, conflict resolution, stashing, rebasing, and safe history management.

The most useful pattern across the certification was combining small tools:

```text
CSV / User Input
       ↓
      Bash
       ↓
      SQL
       ↓
   PostgreSQL
       ↓
 Query Results
       ↓
 Bash / Reports
```

This turns individual commands into repeatable workflows.

# Workshops

1. Learn Bash by Building a Boilerplate
2. Learn Relational Databases by Building a Mario Database
3. Learn Bash Scripting by Building Five Programs
4. Learn SQL by Building a Student Database: Part 1
5. Learn SQL by Building a Student Database: Part 2
6. Learn Advanced Bash by Building a Kitty Ipsum Translator
7. Learn Bash and SQL by Building a Bike Rental Shop
8. Learn Nano by Building a Castle
9. Learn Git by Building an SQL Reference Object

# Course

**freeCodeCamp — Relational Database Certification**

**Topics:** Bash · Linux · PostgreSQL · SQL · Relational Databases · Data Modeling · Shell Scripting · Text Processing · Nano · Git

## Status

✅ All Workshops Completed
