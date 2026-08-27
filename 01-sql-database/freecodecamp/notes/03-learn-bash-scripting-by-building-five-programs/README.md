# Learn Bash Scripting by Building Five Programs

This folder contains my notes from the **Learn Bash Scripting by Building Five Programs** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I built five executable Bash scripts while learning how shell commands become programs. The exercises progressed through variables and user input, script arguments, arithmetic, conditions, loops, arrays, functions, random values, and regular-expression tests.

The five completed `.sh` files are kept in this folder.

## Files Used

| File | Role |
| --- | --- |
| `questionnaire.sh` | Reads answers and prints a personalized response |
| `countdown.sh` | Counts down from a command-line argument |
| `bingo.sh` | Generates a number from 1–75 and assigns its Bingo letter |
| `fortune.sh` | Selects a random response from an array |
| `five.sh` | Runs the other programs from one script |

## Script Basics

```bash
#!/bin/bash
chmod +x questionnaire.sh
./questionnaire.sh
```

The shebang selects Bash as the interpreter. Executable permission allows the script to run directly.

## Variables, Input, and Arguments

```bash
read NAME
echo "Hello $NAME"
./countdown.sh 5
```

`$1` is the first script or function argument, and `$*` represents all arguments. Command exit status is available in `$?`; zero means success.

## Conditions and Regular Expressions

```bash
if [[ $1 =~ ^[0-9]+$ ]]
then
  echo "$1 is a positive integer"
else
  echo "Please provide a positive integer"
fi
```

The workshop used string and numeric tests such as `==`, `-ne`, `-le`, `-ge`, file tests such as `-a` and `-x`, logical `&&`/`||`, and `=~` for regular-expression matching.

## Loops, Arithmetic, and Functions

```bash
for (( i=$1; i>=0; i-- ))
do
  echo "$i"
  sleep 1
done

GET_FORTUNE() {
  echo "${RESPONSES[$1]}"
}
```

I practiced `for`, `while`, and `until` loops. Double parentheses evaluate arithmetic, while `$RANDOM` supplies a pseudo-random integer:

```bash
NUMBER=$(( RANDOM % 75 + 1 ))
```

Arrays are declared with parentheses and expanded with syntax such as `${RESPONSES[$N]}` or `${RESPONSES[@]}`.

## Key Takeaways

- A shebang and executable permission turn a text file into a directly runnable Bash program.
- Positional parameters let one script behave differently based on its arguments.
- `[[ ... ]]` handles tests and regex matching; `(( ... ))` handles arithmetic.
- Loops and functions keep repeated behavior organized.
- Scripts can call other scripts to assemble a larger workflow.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Bash Scripting by Building Five Programs

**Topics:** Bash · Variables · Arguments · Conditions · Loops · Functions · Regex

## Status

✅ Completed
