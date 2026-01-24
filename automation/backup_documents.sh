#!/bin/bash

# --- COLORS DEFINITION ---
# \e[1;31m = Bold Red (Errors)
# \e[1;32m = Bold Green (Success)
# \e[1;33m = Yellow (Warning)
# \e[1;35m = Magenta (Informative notes)
# \e[1;36m = Bold Cyan (Titles)
# \e[0m    = Reset (Returns to default color)

TITLE_COLOR="\e[1;36m"
SUCCESS_COLOR="\e[1;32m"
WARNING_COLOR="\e[1;33m"
NOTE_COLOR="\e[1;35m"
RESET="\e[0m"

echo -e "${TITLE_COLOR}--- Preparing environment for backup ---${RESET}"

BACKUPS_ROOT="$HOME/Backups"

# Checking if BACKUPS_ROOT exists, otherwise we create the directory
if [ ! -d "$BACKUPS_ROOT" ]; then
	echo -e "${WARNING_COLOR}Creating backups folder: \"$BACKUPS_ROOT\"${RESET}"
	mkdir "$BACKUPS_ROOT"
fi

# Creates the subdirectory $BACKUPS_ROOT/Backup_$TIMESTAMP
TIMESTAMP=$(date +"%d-%m-%Y_%H-%M")
mkdir "$BACKUPS_ROOT/Backup_$TIMESTAMP"

# Saving the directory names which we are going to work on
DESKTOP_DIRECTORY=$(xdg-user-dir DESKTOP)
DOCUMENTS_DIRECTORY=$(xdg-user-dir DOCUMENTS)
MUSIC_DIRECTORY=$(xdg-user-dir MUSIC)
PICTURES_DIRECTORY=$(xdg-user-dir PICTURES)
VIDEOS_DIRECTORY=$(xdg-user-dir VIDEOS)
TODAYS_BACKUP_DIRECTORY="$BACKUPS_ROOT/Backup_$TIMESTAMP"

user_directories=("$DESKTOP_DIRECTORY" "$DOCUMENTS_DIRECTORY" "$MUSIC_DIRECTORY" "$PICTURES_DIRECTORY" "$VIDEOS_DIRECTORY")

echo -e "${TITLE_COLOR}--- Initiating backup ---${RESET}"

for directory in "${user_directories[@]}"; do 
    if [ -d "$directory" ]; then
        basename=$(basename "$directory")
        current_backup_directory="$TODAYS_BACKUP_DIRECTORY/$basename"

        echo -e "${NOTE_COLOR} Copying the content of \"$basename\" directory${RESET}"

        if [ ! -d "$current_backup_directory" ]; then
	        echo -e "${WARNING_COLOR}Creating destination folder: \"$current_backup_directory\"${RESET}"
	        mkdir "$current_backup_directory"
        fi

        cp -av "$directory"/. "$current_backup_directory"
    fi
done 

echo -e "${NOTE_COLOR}Saved directories in \"$TODAYS_BACKUP_DIRECTORY\"${RESET}"

echo -e "${SUCCESS_COLOR}--- Backup completed successfully ---${RESET}"