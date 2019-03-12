#!/bin/bash

# This script will install the Go programming language

# INIT .BASHRC_WSL
./bashrc_wsl.sh

sudo apt install -y golang
grep -q -F '# GOLANG' ~/.bashrc_wsl || printf "\n# GOLANG\n" >>  ~/.bashrc_wsl
grep -q -F 'export GOPATH' ~/.bashrc_wsl || echo 'export GOPATH=~/go' >> ~/.bashrc_wsl
