#!/bin/bash

# Set up some output colors
BLUE='\033[0;36m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
GREEN='\033[1;32m'
NOCOLOR='\033[0m'

echo -e "${GREEN}"
echo 'Windows Subsystem for Linux (WSL) Bash Setup'
echo -e "${NOCOLOR}"
echo "This script configures WSL Bash for use with Docker and Git:"
echo ''
echo "* Creates .bashrc_wsl file that is sourced from .bashrc for customizing the bash"
echo "* Installs docker-compose and its dependencies for use on the commandline"
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

# .BASHRC_WSL
# create the .bashrc_wsl file for bash customizations
echo ''
echo -e "${GREEN}"
echo 'Adding .bashrc_wsl ...'
echo -e "${NOCOLOR}"
echo "" > ~/.bashrc_wsl
# If it isn't aleady there, add a line to .bashrc to source .bashrc_wsl so that
# it gets executed when the bash starts up
grep -q -F 'bashrc_wsl' ~/.bashrc || echo 'source ~/.bashrc_wsl' >> ~/.bashrc

# DOCKER
echo -e "${GREEN}"
echo 'Installing and Configuring Docker ...'
echo -e "${NOCOLOR}"
sudo apt-get update
# Remove any existing legacy docker installations
sudo apt-get remove docker docker-engine docker.io
# Make sure we can connect to a repository over https
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
# Add the official Docker Community Edition repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
# Install Docker CE, docker-compose, and PuTTY
sudo apt -q install -y docker-ce docker-compose putty
# Add the current user to the docker group
sudo usermod -aG docker $USER
# Tell docker to connect to the Docker of Windows HOST
echo "export DOCKER_HOST=tcp://127.0.0.1:2375" > ~/.bashrc_wsl
# create symlink /c to mounted windows c drive so that paths will work
sudo rm /c
sudo ln -s /mnt/c /c

# GIT ENABLED PROMPT
echo -e "${GREEN}"
echo 'Installing Git integrated Bash prompt ...'
echo -e "${NOCOLOR}"
rm -rf ~/.bash/git-aware-prompt
git clone https://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
# Add lines to .bashrc_wsl to enable the git-aware-prompt
sudo echo "export GITAWAREPROMPT=~/.bash/git-aware-prompt" >>  ~/.bashrc_wsl
sudo echo 'source "${GITAWAREPROMPT}/main.sh"' >>  ~/.bashrc_wsl
sudo echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\] \[\033[01;33m\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc_wsl

# BASH-GIT-PROMPT
# This is an alternative, more fully featured Git integrated prompt, but it may be slower
# Comment out the prompt install lines above and uncomment the lines below to use it instead
rm -rf ~/.bash/bash-git-prompt
#git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash/bash-git-prompt --depth=1
## Add lines to .bashrc_wsl to enable the bash-git-prompt
#sudo echo "GIT_PROMPT_ONLY_IN_REPO=1" >> ~/.bashrc_wsl
#sudo echo "source ~/.bash/bash-git-prompt/gitprompt.sh" >> ~/.bashrc_wsl

# DEFAULT START DIRECTORY
# Prompt the user for the directory in which bash should start
echo -e "${GREEN}"
echo 'Set the Default Path ...'
echo -e "${YELLOW}"
echo "Enter the staring path for WSL Bash [default: /c]:"
echo -e "${NOCOLOR}"
read -e START_FOLDER
if [ -z "$START_FOLDER"]; then
    START_FOLDER="/c"
fi
echo "Bash will start in $START_FOLDER"
sudo echo "cd $START_FOLDER" >> ~/.bashrc_wsl

echo -e "${GREEN}"
echo WSL Bash Setup complete.
echo -e "${NOCOLOR}"

echo -e "${YELLOW}"
echo 'NOTE: Bash configuration changes will not be applied until WSL Bash is closed and restarted'
echo -e "${NOCOLOR}"
echo ''
