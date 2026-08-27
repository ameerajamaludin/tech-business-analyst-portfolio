# Learn Git by Building an SQL Reference Object

This folder contains my notes from the **Learn Git by Building an SQL Reference Object** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I built `sql_reference.json`, a JSON reference for database, table, column, and row commands, while practicing a complete local Git workflow. Each SQL reference change became a reason to create a branch, inspect changes, stage files, commit, merge, or rewrite history.

The workshop also introduced ignored secrets, stashes, conflict resolution, rebasing, squashing, and reverting a committed change.

## Repository and Files

```bash
mkdir sql_reference
cd sql_reference
git init
touch sql_reference.json README.md .env .gitignore sample.env
```

`.env` held a secret value and was added to `.gitignore`; `sample.env` documented the variable without committing the secret. `git status` was used continually to see untracked, modified, and staged files.

## SQL Reference Object

The JSON object was expanded with reference entries for commands exercised in the workshop:

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

Entries covered creating, renaming, and dropping databases and tables; adding, renaming, and dropping columns; inserting, updating, and deleting rows; and adding `PRIMARY KEY`, `FOREIGN KEY`, and `UNIQUE` constraints.

## Staging and Commits

```bash
git status
git diff
git add sql_reference.json
git commit -m "feat: add create database reference"
```

`git diff` inspects unstaged changes. `git add` moves selected changes to the staging area, and `git commit` records the staged snapshot with a message.

## Branches and Merges

```bash
git checkout -b feat/add-create-table-reference
git branch
git checkout main
git merge feat/add-create-table-reference
git branch -d feat/add-create-table-reference
```

Feature and fix branches isolated each reference change. After merging completed work into `main`, the local branch was deleted. One merge produced conflicts that had to be fixed in the file, staged, and committed.

## Logs, Diffs, and Saved Work

```bash
git log --oneline
git show HEAD~1
git stash
git stash list
git stash show -p
git stash pop
```

`git log` and `git show` inspect recorded history. Stashing temporarily clears uncommitted work so another branch can be handled; `apply` restores a stash without deleting it, `pop` restores and removes it, and `drop` removes it explicitly.

## Rebase and Squash

```bash
git rebase main
git rebase -i HEAD~5
git rebase --continue
```

Rebasing replayed feature work on top of `main`. Interactive rebase was used to reword messages, squash related commits into a cleaner change, and remove unwanted commits. After resolving a rebase conflict, `git rebase --continue` resumed the operation.

## Undoing Changes

```bash
git reset HEAD~1
git revert HEAD
```

`git reset HEAD~1` moved the current branch back during local history editing. `git revert HEAD` created a new commit that reversed an existing commit, preserving the prior history.

## Key Takeaways

- The working tree, staging area, and commit history represent different Git states.
- Small branches keep features and fixes isolated until they are ready to merge.
- Logs, diffs, and shows explain both current changes and earlier commits.
- Stashes protect unfinished work during a context switch.
- Rebase and squash can clean local history; revert records a safe inverse change.
- `.gitignore` prevents a local secret file from being accidentally tracked.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Git by Building an SQL Reference Object

**Topics:** Git · Branches · Merges · Rebase · Stash · Revert · JSON · SQL reference

## Status

✅ Completed
