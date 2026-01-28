# 🧩 Bash Fundamentals Scripts

A collection of **fundamental Bash scripts** focused on core Linux concepts such as file inspection, permissions, standard input/output, argument handling, and signal management.

These scripts are designed as **learning-oriented utilities**, with clean structure, robust validation, and color-coded terminal output for clarity.

---

## 🛠️ Scripts Overview

## 1. `file_checker.sh` — File & Directory Inspector

Displays detailed information about a given file or directory.

### Features
- Validates that the provided path exists.
- Detects whether the target is a **regular file** or a **directory**.
- Shows file size (only for regular files).
- Displays the full permission string (`rwxr-xr-x`).
- Indicates user permissions (read, write, execute).
- Uses color-coded output for clarity.

### Concepts Covered
- Argument validation
- File test operators (`-e`, `-f`, `-d`, `-r`, `-w`, `-x`)
- `stat` command
- Conditional logic
- Terminal colors

### Usage
```bash
./file_checker.sh <file_or_directory>

## 2. `count_lines.sh` — Line Counter

Counts the number of lines in one or more text files.

### Features
- Accepts multiple file arguments.
- Skips non-existent, non-regular, or unreadable files safely.
- Uses stdin redirection to obtain clean numeric output.
- Returns a non-zero exit code if all files fail.

### Concepts Covered
- Positional parameters (`"$@"`)
- Loops
- Input redirection (`wc -l < file`)
- Exit status logic
- Defensive Bash scripting

### Usage
```bash
./count_lines.sh file1.txt file2.txt

## 3. `timer.sh` — Terminal Countdown Timer

A flexible countdown timer supporting seconds, minutes, and hours.

### Features
- Accepts formats like `30`, `10s`, `5m`, `2h`.
- Validates input using regular expressions.
- Converts all units internally to seconds.
- Displays a real-time `HH:MM:SS` countdown.
- Handles `Ctrl+C` gracefully using signal trapping.
- Emits a terminal beep when the timer ends.

### Concepts Covered
- Regular expressions in Bash
- String manipulation
- Arithmetic expansion
- Signal handling with `trap`
- `printf` formatting
- Terminal control (`\r` carriage return)

### Usage
```bash
./timer.sh 5m
