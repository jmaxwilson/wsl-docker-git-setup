#!/bin/bash

# Set up some output colors
source definecolors.sh

# DEFAULT START DIRECTORY
# Prompt the user for the directory in which bash should start
echo -e "${GREEN}"
echo 'Set the Default Path ...'
echo -e "${YELLOW}"
echo "Enter the staring path for WSL Bash [default: /c]:"
echo -e "${NOCOLOR}"
read -e START_FOLDER
if [ -z "$START_FOLDER" ]; then
	START_FOLDER="/c"
fi
echo "Bash will start in $START_FOLDER"
printf "\n# START DIRECTORY\n" >> ~/.bashrc_wsl
echo "cd $START_FOLDER" >> ~/.bashrc_wsl
