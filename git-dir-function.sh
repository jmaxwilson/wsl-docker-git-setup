#!/bin/bash

./bashrc_wsl.sh

grep -q -F '# GIT-DIR' ~/.bashrc_wsl || printf "\n# GIT-DIR\ngit-dir() {\ncd \$2\ngit \$1\ncd ..\n}" >>  ~/.bashrc_wsl
