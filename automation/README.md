# 🚀 Linux Automation Scripts

A collection of professional **Bash scripts** designed to automate routine maintenance, organization, and security tasks on Linux systems (Debian/Ubuntu based).

These scripts are optimized with color-coded terminal output to provide a clear and intuitive user experience.

---

## 🛠️ Scripts Overview

### 1. `backup_documents.sh` (Smart Backup)
Automates the backup process for your primary user directories.
* **Features:** Backs up `Desktop`, `Documents`, `Music`, `Pictures`, and `Videos`.
* **Organization:** Creates a versioned folder inside `~/Backups` using a timestamp (`DD-MM-YYYY_HH-MM`).
* **Usage:** `./backup_documents.sh`

### 2. `organize_downloads.sh` (Downloads Organizer)
Instantly declutters your Downloads folder.
* **Features:** Analyzes every file and moves it into a subdirectory named after its extension (e.g., `.pdf` files go to a `pdf/` folder).
* **Safety:** Skips itself and files without extensions to avoid errors.
* **Usage:** `./organize_downloads.sh`

### 3. `notify_reminder.sh` (Desktop Reminders)
Schedules quick visual notifications directly from the terminal.
* **Features:** Uses the `at` daemon and `notify-send` to trigger a system alert at a specific time.
* **Usage:** `./notify_reminder.sh "Meeting with Team" 15:30`
* *Note: Requires `at` and `libnotify-bin` packages.*

### 4. `update_and_clean.sh` (System Maintenance)
A "one-click" solution to keep your system fast and clean.
* **Workflow:** 1. Updates repository lists.
    2. Performs a full system upgrade.
    3. Removes orphaned dependencies (`autoremove`).
    4. Clears the package cache (`clean`).
    5. Purges residual configuration files from uninstalled packages.
* **Usage:** `./update_and_clean.sh` (Automatically requests `sudo` privileges).

---

## 🚀 Getting Started

### Prerequisites
Ensure you have the following dependencies installed for full functionality:
```bash
sudo apt update && sudo apt install at libnotify-bin xdg-user-dirs -y
