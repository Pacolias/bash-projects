# Bash Automation & Linux Scripting Projects

A technical collection of Bash scripts showcasing practical skills in **Linux system usage, automation, and shell scripting**. The repository focuses on clarity, safety, and usefulness, avoiding toy examples in favor of scripts designed for real environments.

Each script solves a concrete problem related to system maintenance, automation, or developer workflows.

---

## 🎯 What This Repository Demonstrates

This project demonstrates the ability to:

* Write **clean and readable Bash scripts**
* Automate repetitive tasks on a Linux system
* Work confidently with the Linux filesystem and command-line tools
* Handle permissions, processes, and package management
* Structure scripts in a maintainable and reusable way
* Apply basic safety practices (error handling, privilege checks)
* Organize a technical project professionally for GitHub

The focus is on **practical Bash and Linux skills**, presented in a clear and structured manner.

---

## 🗂 Repository Structure

```
bash-projects/
│
├── README.md
├── LICENSE
├── CONTRIBUTING.md
│
├── fundamentals/               # Bash fundamentals and syntax
│   ├── README.md
│   ├── file_checker.sh
│   ├── line_counter.sh
│   └── timer.sh
│
├── automation/                 # Practical system automation
│   ├── README.md
│   ├── backup_documents.sh
│   ├── notify_reminder.sh
│   ├── organize_downloads.sh
│   └── update_and_clean.sh
│
├── devtools/                   # Scripts for development workflows
│   ├── dev_setup.sh
│   ├── autodeploy.sh
│   ├── db_reset.sh
│   └── log_monitor.sh
│
├── advanced/                   # More complex scripts and tools
│   ├── redcheck_cli.sh
│   ├── smart_backup.sh
│   └── linux_bootstrap.sh
│
├── utils/                      # Shared functions and helpers
│   ├── colors.sh
│   ├── io.sh
│   └── logging.sh
│
├── tests/                      # Basic script tests
│   ├── test_file_checker.sh
│   └── test_backup.sh
│
└── docs/                       # Notes and documentation
    ├── bash_style_guide.md
    ├── how_to_debug.md
    └── ideas.md
```

---

## 🧠 Skills Reflected by the Scripts

### Bash & Shell Scripting

* Variables, conditionals, loops
* Functions and modular scripts
* Argument parsing
* Colored terminal output
* Exit codes and basic error handling

### Linux & System Usage

* Filesystem navigation and organization
* Permissions and privilege escalation
* Package management (APT)
* System cleanup and maintenance
* Log inspection and monitoring

### Automation

* Replacing manual system tasks with scripts
* Writing scripts suitable for cron execution
* Creating reproducible workflows

### Code Organization

* Logical project structure
* Separation of concerns
* Reusable utility files
* Basic testing of scripts

---

## 🔧 Usage

### Make a script executable

```bash
chmod +x script_name.sh
```

### Run a script

```bash
./script_name.sh
```

### Source shared utilities

```bash
source utils/colors.sh
```

---

## 🧪 Testing

Some scripts include simple test files located in the `tests/` directory. These tests are intended to:

* Verify expected behavior
* Catch basic errors
* Encourage disciplined scripting practices

---

## 📝 License

This project is licensed under the **MIT License**.

---

## ⭐ Final Note

This repository represents a snapshot of practical skills in Bash scripting and Linux usage. It is designed to evolve over time as more advanced automation and tooling are added.

The emphasis is on **working solutions, clarity, and technical understanding** rather than buzzwords or overengineering.

Happy scripting 🐧

