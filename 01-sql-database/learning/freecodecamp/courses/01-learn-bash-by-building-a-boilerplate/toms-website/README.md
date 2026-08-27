# Build a Boilerplate

This folder contains my notes from the **Build a Boilerplate** workshop in freeCodeCamp's Relational Database Certification.

## Overview

This workshop introduces basic Bash and Linux terminal commands, including navigating directories, creating and managing files, viewing file contents, and working with command-line input and output.

## Navigating the File System

### Print Working Directory

Use `pwd` to display the path of the current working directory.

```bash
pwd
```

### List Files and Directories

Use `ls` to list the contents of the current directory.

```bash
ls
```

List all files, including hidden files:

```bash
ls -a
```

Use the long listing format:

```bash
ls -l
```

### Change Directory

Use `cd` to move into another directory.

```bash
cd <directory>
```

Move to the parent directory:

```bash
cd ..
```

## Creating Files and Directories

### Create a File

Use `touch` to create a new file.

```bash
touch <filename>
```

Example:

```bash
touch index.html
```

### Create a Directory

Use `mkdir` to create a new directory.

```bash
mkdir <directory>
```

Example:

```bash
mkdir website
```

## Viewing File Contents

Use `cat` to display the contents of a file.

```bash
cat <filename>
```

Example:

```bash
cat index.html
```

## Copying, Moving, and Removing Files

### Copy a File

Use `cp` to copy a file.

```bash
cp <file> <destination>
```

### Move a File

Use `mv` to move a file.

```bash
mv <file> <destination>
```

`mv` can also be used to rename a file.

```bash
mv <old-name> <new-name>
```

### Remove a File

Use `rm` to delete a file.

```bash
rm <filename>
```

## Redirecting Output to a File

Use `>` to redirect the output of a command into a file.

```bash
<command> > <filename>
```

Example:

```bash
echo hello bash > stdout.txt
```

## Appending vs Overwriting Files

Use `>>` to append output to an existing file.

```bash
echo hello bash >> stdout.txt
```

Use `>` to overwrite the existing contents of a file.

```bash
echo hello bash > stdout.txt
```

## Redirecting stderr Output

Use `2>` to redirect error output to a file.

```bash
bad_command 2> stderr.txt
```

## Using stdin for Input

Use `read` to get input from standard input.

```bash
read NAME
```

The value can then be accessed using the variable:

```bash
echo $NAME
```

## Piping Commands

Use `|` to pass the output of one command as the input of another command.

```bash
<command1> | <command2>
```

## Commands Learned

| Command | Description |
| --- | --- |
| `pwd` | Display the current working directory |
| `ls` | List files and directories |
| `ls -a` | List all files, including hidden files |
| `ls -l` | Display a detailed directory listing |
| `cd` | Change directory |
| `touch` | Create a file |
| `mkdir` | Create a directory |
| `cat` | Display the contents of a file |
| `cp` | Copy files |
| `mv` | Move or rename files |
| `rm` | Remove files |
| `>` | Redirect output and overwrite a file |
| `>>` | Append output to a file |
| `2>` | Redirect standard error |
| `read` | Read input from stdin |
| `|` | Pipe output between commands |

## What I Learned

Through this workshop, I learned how to navigate and manage files using the Linux command line, work with standard input and output, redirect command output, and combine commands using pipes.

## Course

freeCodeCamp — Relational Database Certification  
**Workshop:** Build a Boilerplate

## Status

🚧 In Progress
