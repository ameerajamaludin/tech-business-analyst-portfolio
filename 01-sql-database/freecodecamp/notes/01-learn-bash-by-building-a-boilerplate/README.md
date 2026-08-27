# Learn Bash by Building a Boilerplate

This folder contains my notes from the **Learn Bash by Building a Boilerplate** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I used a terminal to explore a project tree and organize the files for Tom's website. The exercises introduced paths, command flags, hidden files, and the difference between files and directories.

I also practiced creating, copying, moving, renaming, and removing items. The finished `toms-website/` directory is preserved in this folder.

## Navigation and Inspection

```bash
pwd
ls
ls -l
ls -a
cd toms-website
cd ..
more package.json
clear
```

`pwd` prints the current path. `ls -l` adds details to a listing, while `ls -a` includes hidden entries. `more` displays a file one screen at a time.

## Managing Files and Directories

```bash
touch index.html
mkdir client
cp index.html index-copy.html
mv index-copy.html client/index.html
rm unwanted.txt
rmdir empty-directory
rm -r old-directory
```

The workshop also used command help, including `help`, `ls --help`, and `rm --help`, before applying unfamiliar flags.

## Command Output and Redirection

`echo` prints text in the terminal. The workshop redirected that command output into a file:

```bash
echo hello terminal
echo website > output.txt
```

`>` sends command output to a file instead of the terminal.

| Syntax | Meaning |
| --- | --- |
| `>` | Redirect stdout to a file |

## Key Takeaways

- Absolute and relative paths identify where commands operate.
- Flags change command behavior; help output documents the available options.
- `mv` handles both moving and renaming.
- Recursive removal is needed for a non-empty directory and should be used carefully.
- Output redirection stores a command's result in a file.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Bash by Building a Boilerplate

**Topics:** Bash · Linux terminal · Files · Directories · Command output · Redirection

## Status

✅ Completed
