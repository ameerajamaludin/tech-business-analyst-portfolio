# Learn SQL by Building a Student Database: Part 1

This folder contains my notes from the **Learn SQL by Building a Student Database: Part 1** workshop in freeCodeCamp's Relational Database Certification.

## Overview

In this workshop, I learned how to combine **Bash scripting, PostgreSQL, and SQL** to create and populate a relational student database.

The workshop uses data from CSV files and a Bash script to insert students, majors, courses, and their relationships into PostgreSQL.

## Database Structure

The student database contains four main tables:

```text
students
majors
courses
majors_courses
```

These tables separate student, major, and course information while using keys to establish relationships between them.

## Working with CSV Data

The workshop uses CSV files as the source data:

```text
courses.csv
students.csv
```

### Reading a CSV File

The `cat` command can be used to output the contents of a CSV file:

```bash
cat courses.csv
```

### Reading CSV Rows with a Loop

A `while` loop can process the file one row at a time:

```bash
cat courses.csv | while read MAJOR COURSE
do
  echo $MAJOR
done
```

## Internal Field Separator

CSV values are separated by commas.

Bash's `IFS` (Internal Field Separator) can be set to `,` so that each value is assigned to the correct variable.

```bash
cat courses.csv | while IFS="," read MAJOR COURSE
do
  echo $MAJOR
  echo $COURSE
done
```

For student data:

```bash
cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  echo $FIRST
  echo $LAST
  echo $MAJOR
  echo $GPA
done
```

## Connecting Bash to PostgreSQL

A PostgreSQL command can be stored in a Bash variable:

```bash
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
```

This makes it possible to execute SQL statements directly from the Bash script.

For example:

```bash
$PSQL "SELECT * FROM majors;"
```

## Command Substitution

Bash command substitution can be used to execute a PostgreSQL query and store its result in a variable.

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

This allows the script to use data returned from PostgreSQL in its logic.

## SELECT

`SELECT` retrieves data from a table.

```sql
SELECT major_id
FROM majors
WHERE major='Database Administration';
```

In the Bash script:

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

The returned ID is stored in `MAJOR_ID`.

## INSERT INTO

`INSERT INTO` adds new records to a table.

```sql
INSERT INTO majors(major)
VALUES('Database Administration');
```

Variables can also be included when SQL is executed from Bash:

```bash
INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
```

## Checking Whether Data Exists

Before inserting a record, the script can query the database to determine whether it already exists.

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

The `-z` condition checks whether the returned variable is empty:

```bash
if [[ -z $MAJOR_ID ]]
then
  # insert major
fi
```

This prevents the script from unnecessarily inserting the same major again.

## Skipping CSV Headers

The first row of a CSV file contains column names rather than actual data.

For example:

```text
major,course
```

A condition can prevent this row from being inserted:

```bash
if [[ $MAJOR != "major" ]]
then
  # process row
fi
```

The same concept can be used with the students file:

```bash
if [[ $FIRST != "first_name" ]]
then
  # process student
fi
```

## Inserting Majors

The script first checks whether a major already exists:

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

If no ID is returned, the major can be inserted:

```bash
if [[ -z $MAJOR_ID ]]
then
  INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
fi
```

The new `major_id` can then be retrieved:

```bash
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
```

## Inserting Courses

The same process can be used for courses.

First, find the course:

```bash
COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
```

If it doesn't exist:

```bash
if [[ -z $COURSE_ID ]]
then
  INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
fi
```

Then retrieve its ID:

```bash
COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
```

## Creating Relationships

Majors and courses have a many-to-many relationship.

The `majors_courses` table connects them using their IDs:

```text
majors
   │
   │ major_id
   ▼
majors_courses
   ▲
   │ course_id
   │
courses
```

A relationship can be inserted with:

```sql
INSERT INTO majors_courses(major_id, course_id)
VALUES(major_id, course_id);
```

From the Bash script:

```bash
INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
```

## Handling NULL Values

Not every student has a major.

When a student's major does not exist, the foreign key value can be represented as:

```sql
NULL
```

This allows the student record to exist without requiring a related major.

## Inserting Students

Student information comes from `students.csv`.

Each row contains information such as:

```text
first_name,last_name,major,gpa
```

The script processes these values and inserts them into the `students` table.

Conceptually:

```sql
INSERT INTO students(first_name, last_name, major_id, gpa)
VALUES(...);
```

The `major_id` links the student to their major.

## TRUNCATE

While developing and testing the import script, existing table data can be cleared using:

```sql
TRUNCATE students, majors, courses, majors_courses;
```

This makes it possible to rerun the import process with an empty set of tables.

## Database Relationships

The database can be thought of as:

```text
                    ┌───────────────┐
                    │    majors     │
                    │   major_id    │
                    └───────┬───────┘
                            │
               ┌────────────┴────────────┐
               │                         │
               ▼                         ▼
        ┌──────────────┐        ┌────────────────┐
        │   students   │        │ majors_courses │
        │   major_id   │        │    major_id    │
        └──────────────┘        │    course_id   │
                                └───────┬────────┘
                                        │
                                        ▼
                                ┌──────────────┐
                                │   courses    │
                                │  course_id   │
                                └──────────────┘
```

This structure avoids storing the same major and course information repeatedly.

## SQL Concepts Learned

| Concept        | Purpose                                        |
| -------------- | ---------------------------------------------- |
| `SELECT`       | Retrieve data from a database                  |
| `WHERE`        | Filter records                                 |
| `INSERT INTO`  | Insert new records                             |
| `VALUES`       | Specify values to insert                       |
| `NULL`         | Represent a missing or unknown value           |
| `TRUNCATE`     | Remove all rows from tables                    |
| Primary Key    | Uniquely identify a record                     |
| Foreign Key    | Reference a record in another table            |
| Junction Table | Connect records in a many-to-many relationship |

## Bash Concepts Reinforced

| Concept     | Purpose                              |                              |
| ----------- | ------------------------------------ | ---------------------------- |
| Variables   | Store values                         |                              |
| `$VARIABLE` | Access a variable                    |                              |
| `$()`       | Command substitution                 |                              |
| `while`     | Process data repeatedly              |                              |
| `read`      | Read values into variables           |                              |
| `IFS`       | Define how input should be separated |                              |
| `if`        | Execute conditional logic            |                              |
| `[[ ]]`     | Evaluate conditions                  |                              |
| `-z`        | Check whether a value is empty       |                              |
| `!=`        | Check whether values are different   |                              |
| `           | `                                    | Pipe output between commands |

## Key Takeaways

This workshop helped me understand how Bash and SQL can work together to automate database operations.

Instead of manually inserting every row, I learned how to:

* Read structured data from CSV files.
* Process each row using Bash.
* Query PostgreSQL from a Bash script.
* Check whether records already exist.
* Insert records conditionally.
* Retrieve generated IDs.
* Use IDs to establish relationships between tables.
* Handle missing values with `NULL`.
* Populate a relational database from external data.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn SQL by Building a Student Database: Part 1

**Topics:** SQL · PostgreSQL · Bash · CSV · Relational Databases

## Status

✅ Completed
