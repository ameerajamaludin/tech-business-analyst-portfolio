# Learn SQL by Building a Student Database: Part 2

This folder contains my notes from the **Learn SQL by Building a Student Database: Part 2** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I queried the student database created in Part 1 and collected useful reports in `student_info.sh`. The exercises moved from selecting columns and filtering rows to sorting, aggregates, grouping, and multi-table joins.

The main lesson was how to turn questions about students, majors, and courses into precise SQL queries.

## Filtering Data

```sql
SELECT first_name, last_name, gpa
FROM students
WHERE gpa >= 3.8;
```

The workshop compared text and numbers with `=`, `!=`, `<`, `>`, `<=`, and `>=`, combined conditions with `AND` and `OR`, and tested missing values with `IS NULL` and `IS NOT NULL`. Parentheses make the intended precedence explicit when conditions are mixed.

## Pattern Matching

```sql
SELECT course FROM courses WHERE course LIKE 'Web%';
SELECT course FROM courses WHERE course ILIKE '%a%';
SELECT course FROM courses WHERE course NOT LIKE '% %';
```

`%` matches any number of characters and `_` matches one character. `ILIKE` performs case-insensitive matching. The workshop also concatenated text with `||` before matching it.

## Ordering and Limiting

```sql
SELECT first_name, last_name, gpa
FROM students
WHERE gpa IS NOT NULL
ORDER BY gpa DESC, first_name
LIMIT 10;
```

Multiple `ORDER BY` expressions provide a tie-breaker. `LIMIT` keeps only the requested number of rows.

## Aggregate Queries

| SQL feature | Use in the workshop |
| --- | --- |
| `COUNT` | Count students or non-null values |
| `MIN` / `MAX` | Find GPA boundaries |
| `SUM` / `AVG` | Calculate totals and averages |
| `ROUND` / `CEIL` | Format or round numeric results |
| `DISTINCT` | Return each value once |
| `GROUP BY` | Produce results per major |
| `HAVING` | Filter grouped results |

```sql
SELECT major_id, COUNT(*) AS number_of_students
FROM students
GROUP BY major_id
HAVING COUNT(*) > 1;
```

`WHERE` filters rows before grouping; `HAVING` filters the groups produced by an aggregate query.

## SQL Joins

The workshop compared all four join types between `students` and `majors`:

| Join | Rows retained |
| --- | --- |
| `INNER JOIN` | Only matching rows |
| `LEFT JOIN` | Every left-table row |
| `RIGHT JOIN` | Every right-table row |
| `FULL JOIN` | Every row from both tables |

```sql
SELECT first_name, last_name, major
FROM students
LEFT JOIN majors USING(major_id);
```

`USING(major_id)` joins tables that share the same key name. Chained joins through `majors_courses` connect students to the courses required by their majors. Table aliases such as `students AS s` make longer joins easier to read.

## Bash Report Script

```bash
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo "$($PSQL "SELECT COUNT(*) FROM students")"
```

`student_info.sh` runs the completed queries and prints labeled sections for reports such as top GPAs, course-name patterns, majors without students, and course/student combinations.

## Key Takeaways

- Filtering, pattern matching, ordering, and limiting shape a result set in different stages.
- Aggregates summarize rows, while `GROUP BY` changes the unit being summarized.
- `HAVING` applies conditions to grouped results.
- The chosen join determines whether unmatched rows remain visible.
- A Bash script can turn a set of SQL queries into a repeatable report.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn SQL by Building a Student Database: Part 2

**Topics:** SQL · Filtering · Pattern matching · Aggregates · Grouping · Joins

## Status

✅ Completed
