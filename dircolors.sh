#!/bin/bash

# DIRCOLORS
# Create ~/.dircolors and set the color of directories
echo "DIR 04;34 # directory
OTHER_WRITABLE 04;36 # dir that is other-writable (o+w) and not sticky
STICKY 04;44 # dir with the sticky bit set (+t) and not other-writable
STICKY_OTHER_WRITABLE 04;42 # dir that is sticky and other-writable (+t,o+w)" > ~/.dircolors

