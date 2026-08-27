# Learn Nano by Building a Castle

This folder contains my notes from the **Learn Nano by Building a Castle** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I created `castle.sh` and edited it entirely in Nano, a terminal text editor. The script prints an ASCII castle whose walls, roof, towers, windows, and door were added and corrected over several edit/save/run cycles.

The exercises focused on opening a file, navigating without a mouse, cutting and restoring lines, saving changes, and returning to the terminal to test the script.

## Opening and Testing the File

```bash
touch castle.sh
nano castle.sh
bash castle.sh
```

`nano filename` opens a file in the editor. After saving and exiting, `bash castle.sh` runs the script so its terminal output can be checked before editing again.

## Nano Shortcut Notation

Nano displays commands at the bottom of the editor. `^` means Ctrl. `M-` means Meta; on most non-macOS systems this is Alt, while the workshop explains it as Escape followed by the letter on macOS.

| Shortcut | Action used in the workshop |
| --- | --- |
| `Ctrl + O` | Write out, or save, the file |
| `Enter` | Confirm the current filename after writing out |
| `Ctrl + X` | Exit Nano |
| `Ctrl + K` | Cut the current line |
| `Ctrl + U` | Uncut, or paste, the cut line |

## Editing Workflow

The cursor was moved with the keyboard rather than a mouse. I first removed a temporary line with `Ctrl + K`, then created a multiline `echo` command for the castle:

```bash
echo "
 /\                /\
/  \              /  \
|  |______________|  |
|  |  []      []  |  |
|  |              |  |
|  |      __      |  |
|  |     |  |     |  |
|__|_____|__|_____|__|
"
```

Repeated wall rows were created efficiently by cutting and uncutting a line. Saving frequently and running the script exposed layout problems, including the damaged roof exercise, so they could be fixed in the editor.

## Key Takeaways

- Nano provides a complete file-editing workflow inside the terminal.
- The shortcut legend uses `^` for Ctrl and `M-` for Meta.
- `Ctrl + O`, followed by Enter, saves without changing the filename.
- Cut and uncut are useful for moving or duplicating whole lines.
- Alternating between editing and running a script gives quick feedback.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Nano by Building a Castle

**Topics:** Nano · Terminal editing · Keyboard shortcuts · Bash · ASCII art

## Status

✅ Completed
