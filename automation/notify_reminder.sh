#!/usr/bin/env bash

# --- COLORS DEFINITION ---
# \e[1;31m = Bold Red (Errors)
# \e[1;32m = Bold Green (Success)
# \e[1;33m = Yellow (Warning)
# \e[1;35m = Magenta (Informative notes)
# \e[1;36m = Bold Cyan (Titles)
# \e[0m    = Reset (Returns to default color)

ERROR_COLOR="\e[1;31m"
TITLE_COLOR="\e[1;36m"
SUCCESS_COLOR="\e[1;32m"
WARNING_COLOR="\e[1;33m"
NOTE_COLOR="\e[1;35m"
RESET="\e[0m"

# Checks if there are two arguments
if [ $# -ne 2 ]; then 
    echo -e "${ERROR_COLOR}Error: You must provide two arguments${RESET}"
    echo -e "${WARNING_COLOR}Usage: $0 <Reminder_message> <Time_to_be_notified_at>"
    exit 1 
fi

# Checks if the reminder is not a null string 
if [[ -z "$1" ]]; then 
    echo -e "${ERROR_COLOR}Error: You must provide a reminder message${RESET}"
    exit 1
fi

# Validates if time format is HH:MM 
TIME_REGEX="^([0-1][0-9]|2[0-3]):[0-5][0-9]$"
time="$2"

while [[ ! "$time" =~ $TIME_REGEX ]]; do 

    if [[ -n "$time" ]]; then 
        echo -e "${WARNING_COLOR}Error: $time is not a valid time format (HH:MM)${RESET}"
    fi 

    read -p "Please, introduce the time you want to be notified at (format 00:00 to 23:59): " time

done

# Sets notification at the specified time
echo "notify-send -i clock -t 5000 \"Notification\" \"$1\"" | at "$time"

echo -e "${SUCCESS_COLOR}--- Notification set successfully ---${RESET}"