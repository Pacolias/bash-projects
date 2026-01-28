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
    echo -e "${ERROR_COLOR}Error: You must provide exactly one argument${RESET}"
    echo -e "${WARNING_COLOR}Usage: $0 <file_path>"
    exit 1
fi

TARGET="$1"

# Checks if the provided path exists
if [[ ! -e "$TARGET" ]]; then 
    echo -e "${ERROR_COLOR}Error: The given path does not exist${RESET}"
    exit 1
fi 

echo -e "${NOTE_COLOR}Path exists${RESET}"

# At this point, we know the path is correct 
PERMS=$(stat -c "%A" "$TARGET")

[[ -r "$TARGET" ]] && r="✔" || r="✖"
[[ -w "$TARGET" ]] && w="✔" || w="✖"
[[ -x "$TARGET" ]] && x="✔" || x="✖"

if [[ -f "$TARGET" ]]; then 
    SIZE=$(stat -c "%s" "$TARGET")
    echo -e "${NOTE_COLOR}Type: Regular file${RESET}"
    echo -e "${NOTE_COLOR}Size: $SIZE bytes${RESET}"
fi

if [[ -d "$TARGET" ]]; then 
    echo -e "${NOTE_COLOR}Type: Directory${RESET}"
fi

echo -e "${NOTE_COLOR}Perms: $PERMS${RESET}"
echo -e "${NOTE_COLOR}User privileges: read $r, write $w, execution $x${RESET}"