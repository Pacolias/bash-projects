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

# Checks if the user has provided exactly one argument
if [ $# -ne 1 ]; then 
    echo -e "${ERROR_COLOR}Error: Missing duration argument${RESET}"
    echo -e "${WARNING_COLOR}Usage: $(basename "$0") <seconds|Nm|Nh>${RESET}"
    exit 1
fi

TIME_REGEX="^[0-9]+(s|m|h)?$"

# Checks if the argument has the correct format 
if [[ ! "$1" =~ $TIME_REGEX ]]; then 
    echo -e "${ERROR_COLOR}Error: Invalid duration format${RESET}"
    echo -e "${WARNING_COLOR}Usage: $(basename "$0") <seconds|Nm|Nh>${RESET}"
    exit 1
fi

time_string=$1

# Extracts the number string representing the time
if [[ "$time_string" =~ [smh]$ ]]; then 
    time="${time_string:0:-1}"
else 
    time="$time_string"
fi

TIME_REGEX_M="^[0-9]+m$"
TIME_REGEX_H="^[0-9]+h$"

# Converts the current time (minutes) into seconds
if [[ "$time_string" =~ $TIME_REGEX_M ]]; then 
    time=$((time * 60))
fi

# Converts the current time (hours) into seconds
if [[ "$time_string" =~ $TIME_REGEX_H ]]; then 
    time=$((time * 3600))
fi

trap 'echo -e "\n${WARNING_COLOR}Timer cancelled${RESET}"; exit 130' INT

# Shows countdown
for ((i="$time"; i >= 0; i--)); do
    hh=$((i/3600))
    mm=$(((i % 3600)/60)) 
    ss=$((i % 60))

    printf "\r${NOTE_COLOR}Time remaining: %02d:%02d:%02d${RESET}" $hh $mm $ss
    ((i > 0)) && sleep 1
done

echo -e "\n${SUCCESS_COLOR}Time's up!${RESET}"
echo -e "\a"

exit 0