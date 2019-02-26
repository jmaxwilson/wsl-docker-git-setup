#!/bin/bash

# Set up some output colors
source definecolors.sh

# .BASHRC_WSL
# create the .bashrc_wsl file for bash customizations if it doesn't already exist
if [ ! -f ~/.bashrc_wsl ]
then
echo ''
echo -e "${GREEN}"
echo 'Adding .bashrc_wsl ...'
echo -e "${NOCOLOR}"
echo "# WSL CUSTOMIZATIONS" > ~/.bashrc_wsl
fi

# If it isn't aleady there, add a line to .bashrc to source .bashrc_wsl so that
# it gets executed when the bash starts up
grep -q -F 'bashrc_wsl' ~/.bashrc || printf '\n# EXTERNAL WSL CUSTOMIZATIONS\nsource ~/.bashrc_wsl' >> ~/.bashrc

