#!/bin/bash

# Creates a function that act like aliases that allow you to run git commands against directories without being in them
# git-dir pull /dev/code/myproject
# git-all pull /dev/code/

./bashrc_wsl.sh

# Add git-dir function to ~/.bashrc_wsl
grep -q -F '# GIT-DIR' ~/.bashrc_wsl || echo "
# git-dir
# A useful bash script for running git commands on directories
# Adapted from https://github.com/jmaxwilson/git-dir
git-dir ()
{
if [[ \$# -eq 0 ]] ; then # If no arguments are passed offer some guidance 
        printf "Usage: git-dir [git commands and options] [path]\\n\\n"
else
        INIT_DIR=\"\$PWD\" # Store the current directory so we can return to it
        GIT_ARGS=\${@:1:\$((\$# - 1))} # Get all of the args except for the last one as git arguments
        TARGET_PATH=\${@:\$#} # Get the last argument as the target path
        cd \"\$TARGET_PATH\" # change to the target path directory
        if [ -d .git ]; then # If the current directory is a git repo then run the git command here
                git \$GIT_ARGS
        else # If the current directory is not a repo, search for subdirs for repos
                REPO_COUNT=\$(ls -R -d */.git 2>/dev/null | wc -l)
                if [ \$REPO_COUNT -gt 0 ]; then # If we found repos
                        printf \"Found \$REPO_COUNT repositories:\\n\\n\" # List the repos
                        ls -R -d */.git 2>/dev/null | sed 's/\/.git//' && echo \"\"
                        read -r -p \"Run git \$GIT_ARGS on these repos? [Y/n] \" CONFIRM #prompt for confirmation
                        if [[ \$CONFIRM =~ ^[Yy]$ || \$CONFIRM == \"\" ]]; then # if Y, y, or [Enter] run git command on each repo
                                printf \"\\n\"
                                ls -R -d */.git 2>/dev/null | sed 's/\/.git//' | xargs -P10 -I{} git -C {} \$GIT_ARGS 
                        fi
                else
                        echo \"No repositories found.\"
                fi
        fi        
        cd \"\$INIT_DIR\" # return to the directory that we started in
fi
}" >>  ~/.bashrc_wsl
