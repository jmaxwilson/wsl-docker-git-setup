#!/bin/bash

# DIRCOLORS
# Create ~/.dircolors and set the color of directories
echo "STICKY_OTHER_WRITABLE 04;32 # dir that is sticky and other-writable (+t,o+w)
OTHER_WRITABLE 04;32 # dir that is other-writable (o+w) and not sticky
DIR 04;36 # directory
STICKY 04;44 # dir with the sticky bit set (+t) and not other-writable" > ~/.dircolors

