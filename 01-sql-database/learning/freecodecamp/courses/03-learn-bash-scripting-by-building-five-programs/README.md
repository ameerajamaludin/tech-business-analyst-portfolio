# Learn Bash Scripting by Building Five Programs

This folder contains my notes from the **Build Five Programs** workshop in freeCodeCamp's Relational Database Certification.

## Overview

In this workshop, I learned the fundamentals of Bash scripting by building five small programs.

The workshop builds on basic terminal commands and introduces how commands, variables, user input, conditional logic, loops, functions, and other Bash features can be combined into executable scripts.

## Bash Scripts

A Bash script is a file containing commands that Bash can execute.

A script can begin with a **shebang**:

```bash
#!/bin/bash
```

This tells the system to use Bash to execute the script.

### Running a Bash Script

A script can be executed with:

```bash
./script.sh
```

The file needs executable permissions before it can be run this way.

```bash
chmod +x script.sh
```

## Variables

Variables can be created by assigning a value:

```bash
NAME="value"
```

The value can be accessed using `$`:

```bash
echo $NAME
```

There should be no spaces around `=` when assigning a variable.

## User Input

The `read` command can be used to receive input from the user.

```bash
read NAME
```

The input is stored in the variable:

```bash
echo $NAME
```

## Script Arguments

Arguments can be passed to a script from the command line.

```bash
./script.sh argument
```

Inside the script, positional parameters can be used to access them:

```bash
$1
$2
```

Where:

* `$1` represents the first argument.
* `$2` represents the second argument.

## Conditional Statements

Bash can execute different commands depending on whether a condition is true or false.

```bash
if [[ CONDITION ]]
then
  # commands
else
  # commands
fi
```

## Numeric Conditions

Arithmetic expressions can be evaluated using double parentheses:

```bash
if (( NUMBER <= 15 ))
then
  echo "Condition is true"
fi
```

## Loops

Loops allow commands to be executed repeatedly.

### for Loop

```bash
for (( i = 1; i <= 5; i++ ))
do
  echo $i
done
```

### while Loop

```bash
while [[ CONDITION ]]
do
  # commands
done
```

### until Loop

An `until` loop continues running until its condition becomes true.

```bash
until [[ CONDITION ]]
do
  # commands
done
```

## Functions

Functions allow a set of commands to be grouped together and reused.

```bash
FUNCTION_NAME() {
  # commands
}
```

Call the function using:

```bash
FUNCTION_NAME
```

Functions can also receive arguments:

```bash
FUNCTION_NAME argument
```

The argument can then be accessed inside the function using `$1`.

## Random Numbers

Bash provides the `$RANDOM` variable for generating pseudo-random numbers.

```bash
echo $RANDOM
```

Arithmetic can be used to restrict the generated number to a particular range.

```bash
NUMBER=$(( RANDOM % 75 + 1 ))
```

## Regular Expressions

Bash conditions can use `=~` to compare text against a regular expression.

```bash
[[ $VARIABLE =~ REGEX ]]
```

For example, a condition can check whether user input follows a particular pattern.

## The Five Programs

### 1. Questionnaire

`questionnaire.sh`

A simple interactive program that asks the user questions and stores their responses.

This program introduced concepts such as:

* Bash scripts
* Variables
* `echo`
* User input with `read`
* Using input stored in variables

### 2. Countdown

`countdown.sh`

A program that performs a countdown based on an argument passed to the script.

This program introduced concepts such as:

* Script arguments
* Positional parameters
* Loops
* Conditional logic
* Arithmetic operations

### 3. Bingo Number Generator

`bingo.sh`

A program that generates a random Bingo number and determines the corresponding letter.

This program introduced concepts such as:

* `$RANDOM`
* Arithmetic expressions
* `if` statements
* `elif`
* `else`
* Numeric comparisons

### 4. Fortune Teller

`fortune.sh`

An interactive fortune-telling program that asks the user for a question and returns a random response.

This program introduced concepts such as:

* Arrays
* Random values
* Functions
* Function arguments
* User input
* `until` loops
* Regular-expression matching

### 5. Run All Programs

`five.sh`

The final script runs the other four programs in sequence.

```bash
./questionnaire.sh
./countdown.sh 3
./bingo.sh
./fortune.sh
```

This demonstrated how one Bash script can execute other scripts and combine multiple programs into a single workflow.

## Bash Concepts Learned

| Concept                | Purpose                                |
| ---------------------- | -------------------------------------- |
| `#!/bin/bash`          | Specify Bash as the script interpreter |
| `chmod +x`             | Make a script executable               |
| `./script.sh`          | Execute a script                       |
| `VARIABLE=value`       | Create or assign a variable            |
| `$VARIABLE`            | Access a variable                      |
| `read`                 | Get input from the user                |
| `$1`, `$2`, ...        | Access script or function arguments    |
| `if` / `elif` / `else` | Conditional logic                      |
| `[[ ]]`                | Evaluate conditional expressions       |
| `(( ))`                | Evaluate arithmetic expressions        |
| `for`                  | Repeat commands using a loop           |
| `while`                | Repeat while a condition is true       |
| `until`                | Repeat until a condition becomes true  |
| `$RANDOM`              | Generate a pseudo-random number        |
| `FUNCTION_NAME()`      | Define a function                      |
| `=~`                   | Match against a regular expression     |

## Files

```text
.
├── questionnaire.sh
├── countdown.sh
├── bingo.sh
├── fortune.sh
├── five.sh
└── README.md
```

## What I Learned

This workshop helped me understand how Bash moves beyond individual terminal commands into scripting and automation.

I learned how to combine variables, user input, arguments, conditional statements, loops, functions, random values, and other Bash features to create small interactive programs.

Building the programs separately also helped demonstrate how scripts can be broken into smaller pieces and then executed together as part of a larger workflow.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Build Five Programs

**Topic:** Bash Scripting

## Status

✅ Completed
