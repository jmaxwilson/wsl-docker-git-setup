#!/bin/bash

grep -q -F 'alias ls=' ~/.bash_aliases || echo 'alias ls="ls --color=auto --file-type --human-readable --group-directories-first"' >> ~/.bash_aliases
grep -q -F 'alias tree=' ~/.bash_aliases || echo 'alias tree="tree -L 2"' >> ~/.bash_aliases
# grep -q -F 'alias code=' ~/.bash_aliases || echo 'alias code="cmd.exe /c C:/Program\ Files/Microsoft\ VS\ Code/bin/code.cmd $@"' >> ~/.bash_aliases
