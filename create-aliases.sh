#!/bin/bash

# Create an alias that overrides the ls command to use human readable sizes and to group directories first
grep -q -F 'alias ls=' ~/.bash_aliases || echo 'alias ls="ls --color=auto --file-type --human-readable --group-directories-first"' >> ~/.bash_aliases

# Create an alias that overrides the tree command to show two levels by default and show directories first 
grep -q -F 'alias tree=' ~/.bash_aliases || echo 'alias tree="tree --dirsfirst -L 2"' >> ~/.bash_aliases

# create an alias that will opnen the specified directory in windows version of VS Code
# NOTE: This is probably not needed now VS Code should with WSL should do this out of the box
# grep -q -F 'alias code=' ~/.bash_aliases || echo 'alias code="cmd.exe /c C:/Program\ Files/Microsoft\ VS\ Code/bin/code.cmd $@"' >> ~/.bash_aliases
