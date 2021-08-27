#!/bin/bash

# This script will install the Go programming language

# INIT .BASHRC_WSL
./bashrc_wsl.sh

wget https://golang.org/dl/go1.17.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
rm go1.17.linux-amd64.tar.gz
grep -q -F '# GOLANG' ~/.bashrc_wsl || printf "\n# GOLANG\n" >>  ~/.bashrc_wsl
grep -q -F '/usr/local/go/bin' ~/.bashrc_wsl || echo 'PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc_wsl
