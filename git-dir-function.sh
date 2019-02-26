#!/bin/bash

./bashrc_wsl.sh

grep -q -F '# GIT-DIR' ~/.bashrc_wsl || printf "\n# GIT-DIR\ngit-dir() {\ncd \$1\ngit \$2\ncd ..\n}" >>  ~/.bashrc_wsl
