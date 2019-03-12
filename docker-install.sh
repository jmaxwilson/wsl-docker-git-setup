#!/bin/bash

# Installs docker and docker-compose
# Adds a DOCKER_HOST environment variable in .bashrc_wsl to allow docker to connect to Docker for Windows
# Adds a symlink /c that points to the c drive shared by Docker for Windows so that docker paths work properly

# Set up some output colors
source definecolors.sh

# INIT .BASHRC_WSL
./bashrc_wsl.sh

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
grep -q -F '# DOCKER' ~/.bashrc_wsl || printf "\n# DOCKER\n" >>  ~/.bashrc_wsl
grep -q -F 'export DOCKER_HOST' ~/.bashrc_wsl || echo "export DOCKER_HOST=tcp://127.0.0.1:2375" >> ~/.bashrc_wsl
# create symlink /c to mounted windows c drive so that paths will work
sudo rm /c
sudo ln -s /mnt/c /c
