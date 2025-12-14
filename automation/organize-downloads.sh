#!/bin/bash

# --- COLORS DEFINITION ---
# \e[1;36m = Bold Cyan (Titles)
# \e[1;32m = Bold Green (Success)
# \e[1;31m = Bold Red (Warning/Errors)
# \e[1;35m = Magenta (Informative notes)
# \e[0m    = Reset (Returns to default color)

TITLE_COLOR="\e[1;36m"
SUCCESS_COLOR="\e[1;32m"
WARNING_COLOR="\e[1;33m" # Yellow
NOTE_COLOR="\e[1;35m"
RESET="\e[0m"

DOWNLOADS_DIRECTORY=$(xdg-user-dir DOWNLOAD)
script_name=$(basename "$0")

cd "$DOWNLOADS_DIRECTORY" || exit

echo -e "${TITLE_COLOR}--- Analyzing $DOWNLOADS_DIRECTORY file by file ---${RESET}"

for file in "$DOWNLOADS_DIRECTORY"/*; do
	if [ -f "$file" ]; then
		echo -e "${NOTE_COLOR}Analyzing: $file${RESET}"

		filename=$(basename "$file")
		extension="${filename##*.}"

		if [ "$extension" == "$filename" ]; then
			echo -e "${WARNING_COLOR}Skipping $filename (no extension)${RESET}"
			continue
		fi

		if [ "$script_name" == "$filename" ]; then
			echo -e "${WARNING_COLOR}Skipping myself ($filename)${RESET}"
			continue
		fi

		lower_case_extension="${extension,,}"
		destination_folder="$DOWNLOADS_DIRECTORY/$lower_case_extension"

		if [ ! -d "$destination_folder" ]; then
			echo -e "${WARNING_COLOR}Creating destination folder: $lower_case_extension${RESET}"
			mkdir "$destination_folder"
		fi

		echo -e "${NOTE_COLOR}Moving $file to $destination_folder...${RESET}"
		mv -n -v "$file" "$destination_folder"
	fi
done

echo -e "${SUCCESS_COLOR}--- Downloads directory organized successfully ---${RESET}"
