#!/bin/bash

# This script runs the scripts to set up a ~/.bashrc_wsl file to customize bash under WSL
# It installs docker and configures it to work with Docker for Windows
# It installs and enables a git enabled bash prompt that will show the current branch of git
# It sets the default directory to start in when bash opens

# Set up some output colors
source definecolors.sh

echo -e "${GREEN}"
echo 'Windows Subsystem for Linux (WSL) Bash Setup'
echo -e "${NOCOLOR}"
echo "This script configures WSL Bash for use with Docker and Git:"
echo ''
echo "* Creates .bashrc_wsl file that is sourced from .bashrc for customizing the bash"
echo "* Installs docker-ce, docker-compose and their dependencies for use on the commandline"
echo "* Adds a DOCKER_HOST environment variable in .bashrc_wsl to allow docker to connect to Docker for Windows"
echo "* Adds a symlink /c that points to the c drive shared by Docker for Windows so that docker paths work properly"
echo "* Adds a Git enabled prompt so that you can see Git branch information on the commandline"
echo "* Sets the default directory when WSL Bash starts"
echo -e "${YELLOW}"
read -r -p "Continue? [y/N] " response
echo -e "${NOCOLOR}"
case "$response" in
    [yY][eE][sS]|[yY])         
        ;;
    *)
        exit
        ;;
esac

# RESET
# Clear ~/bashrc_wsl so that we start with a clean slate
rm ~/.bashrc_wsl

# INIT .BASHRC_WSL
./bashrc_wsl.sh

# DOCKER
./docker-install.sh

# GIT ENABLED PROMPT
./gitprompt-install.sh

# DEFAULT START DIRECTORY
./defaultdir.sh

echo -e "${GREEN}"
echo WSL Bash Setup complete.
echo -e "${NOCOLOR}"

echo "The following additional scripts can be used for additional customization and installation:"
echo ''
echo "./create-aliases.sh     - Create aliases that override the default options for ls and tree"
echo "./dircolors.sh          - Create a ~/.dircolors file that overrides directory display colors"
echo "./git-dir-functions.sh  - Creates functions to make it easy to run git commands on directories"
echo "./golang-install.sh     - Installs Go programming language support"
echo "./nodejs-install.sh     - Installs NodeJS programming language support"

echo -e "${YELLOW}"
echo 'NOTE: Bash configuration changes will not be applied until WSL Bash is closed and restarted'
echo -e "${NOCOLOR}"
echo ''
