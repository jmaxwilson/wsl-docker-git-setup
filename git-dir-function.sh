#!/bin/bash

# Creates some functions that act like aliases that allow you to run git commands against directories without being in them
# git-dir pull /dev/code/myproject
# git-all pull /dev/code/

./bashrc_wsl.sh

# Add a function to easily run a git command against the specified git directory
# git-dir pull /dev/code/
grep -q -F '# GIT-DIR' ~/.bashrc_wsl || printf "\n# GIT-DIR\ngit-dir() {\nINITDIR=\"\$PWD\"\ncd \$2\ngit \$1\ncd \"\$INITDIR\"\n}" >>  ~/.bashrc_wsl

# Add a function to easily run a git command against all the repositories in the specified dir
# git-all pull /dev/code/
grep -q -F '# GIT-ALL' ~/.bashrc_wsl || printf "\n# GIT-ALL\ngit-all() {\nINITDIR=\"\$PWD\"\ncd \$2\nls -R --directory --color=never */.git | sed 's/\/.git//' | xargs -P10 -I{} git -C {}  \$1\ncd \"\$INITDIR\"\n}" >>  ~/.bashrc_wsl


