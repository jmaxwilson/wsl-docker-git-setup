#!/bin/bash

grep -q -F 'alias code=' ~/.bash_aliases || echo 'alias code="cmd.exe /c C:/Program\ Files/Microsoft\ VS\ Code/bin/code.cmd $@"' >> ~/.bash_aliases
