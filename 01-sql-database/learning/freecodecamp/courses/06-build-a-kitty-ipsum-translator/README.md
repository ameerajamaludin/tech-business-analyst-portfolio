# Learn Advanced Bash by Building a Kitty Ipsum Translator

This folder contains my notes from the **Learn Advanced Bash by Building a Kitty Ipsum Translator** workshop in freeCodeCamp's Relational Database Certification.

## Overview

I analyzed two Kitty Ipsum text files and wrote their counts and matching line numbers to `kitty_info`. I then built `translate.sh`, which reads text and translates cat-related words into dog-related words with `sed`.

The workshop focused on standard streams and small Unix text tools that become more useful when connected with redirection and pipes.

## Files Used

| File | Purpose |
| --- | --- |
| `kitty_ipsum_1.txt`, `kitty_ipsum_2.txt` | Input text for analysis |
| `kitty_info` | Appended line, word, character, match, and line-number results |
| `translate.sh` | Reads input and applies substitutions |
| `doggy_1.txt`, `doggy_2.txt` | Translated output |

## Standard Input, Output, and Errors

```bash
./translate.sh < kitty_ipsum_1.txt > doggy_1.txt
bad_command 2> stderr.txt
echo hello bash >> stdout.txt
```

`<` supplies a file as stdin, `>` replaces a file with stdout, and `>>` appends stdout. File descriptor `1` is stdout and `2` is stderr, so each stream can be redirected separately.

## Counting Text with `wc`

```bash
wc -l < kitty_ipsum_1.txt
wc -w < kitty_ipsum_1.txt
wc -m < kitty_ipsum_1.txt
```

These count lines, words, and characters. Redirecting the file to stdin returns only the count, without a filename in the output.

## Finding Text with `grep`

```bash
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l
grep -n 'meow[a-z]*' kitty_ipsum_2.txt
```

`-o` prints each matching fragment and `-n` includes line numbers. Patterns such as `cat[a-z]*` match `cat` followed by zero or more lowercase letters. Extended regex mode, `-E`, supports grouped alternatives used later in the translator.

## Translating with `sed`

```bash
sed -E 's/cat|catnip/dog/g; s/meow|meowzer/woof/g'
```

The substitution command replaces matched text. The `g` flag replaces every match on a line, and `-E` enables extended regular expressions. The script reads with `cat $1`, pipes the content through multiple substitutions, and writes translated files with `>`.

```bash
cat kitty_ipsum_1.txt | ./translate.sh
diff --color kitty_ipsum_1.txt doggy_1.txt
```

`diff` makes the translation changes visible.

## Key Takeaways

- stdin, stdout, and stderr can be connected to files or other commands independently.
- `wc`, `grep`, and `sed` each do one focused text-processing job.
- Pipes avoid intermediate files when one command's output is the next command's input.
- Regex quantifiers and alternatives make searches and substitutions flexible.
- `>` overwrites output, while `>>` accumulates report sections.

## Course

**freeCodeCamp — Relational Database Certification**

**Workshop:** Learn Advanced Bash by Building a Kitty Ipsum Translator

**Topics:** Bash · Text processing · Regex · grep · sed · Redirection · Pipes

## Status

✅ Completed
