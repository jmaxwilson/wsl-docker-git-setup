#!/bin/bash

# Creates some functions that act like aliases that allow you to run git commands against directories without being in them
# git-dir pull /dev/code/myproject
# git-all pull /dev/code/

./bashrc_wsl.sh

# Add a function to easily run a git command on a specified path
# If the path is a git repo it will run the specified git commands on it
# If the path is not a git repo, it will search subdirectories for repos and run the git command on them
# git-dir pull /dev/code/
grep -q -F '# GIT-DIR' ~/.bashrc_wsl || echo "# GIT-DIR
# A useful bash function for running git commands on directories
git-dir() {
if [[ \$# -eq 0 ]] ; then # If no arguments are passed offer some guidance 
        printf \"Usage: git-dir [git commands and options] [path]\n\n\"
else
        INIT_DIR="\$PWD" # Store the current directory so we can return to it
        GIT_ARGS=\${@:1:\$((\$# - 1))} # Get all of the args except for the last one as git arguments
        TARGET_PATH=\${@:\$#} # Get the last argument as the target path
        cd "\$TARGET_PATH" # change to the target path directory
        if [ -d .git ]; then # If the current directory is a git repo then run the git command here
                git \$GIT_ARGS
        else # If the current directory is not a repo, search subdirs for repos and run the git command on them
                ls -R --directory --color=never */.git | sed 's/\/.git//' | xargs -P10 -I{} git -C {} \$GIT_ARGS
        fi        
        cd "\$INIT_DIR" # return to the directory that we started in
fi
}" >>  ~/.bashrc_wsl


