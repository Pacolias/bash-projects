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

# Checks if the user has provided at least one argument
if [ $# -eq 0 ]; then 
    echo -e "${ERROR_COLOR}Error: You must provide at least one argument${RESET}"
    echo -e "${WARNING_COLOR}Usage: $(basename "$0") <file> ...${RESET}"
    exit 1
fi

num_lines=0
success=0

for file_name in "$@"; do

    # Checks if the file exists
    if [[ ! -e "$file_name" ]]; then 
        echo -e "${ERROR_COLOR}Error: $file_name does not exist${RESET}"
        continue
    fi 

    # Checks it is regular
    if [[ ! -f "$file_name" ]]; then 
        echo -e "${ERROR_COLOR}Error: $file_name is not a regular file${RESET}"
        continue
    fi
  
    # Checks it is legible
    if [[ ! -r "$file_name" ]]; then 
        echo -e "${ERROR_COLOR}Error: $file_name is not readable${RESET}"
        continue
    fi 
    
    # Use stdin redirection to get only the line count
    num_lines=$(wc -l < "$file_name")

    echo -e "${NOTE_COLOR}$file_name : $num_lines lines${RESET}"

    success=1

done

exit $((!success))