#
# This runs the gnucash-devkit container, hooking it in to
#  the local file system for logging and other things.
#
#

docker run                             \
  -it                                  \
  --rm                                 \
  --net host                           \
  -v /home:/home                       \
  -e "TERM=xterm-256color"             \
  -w ${PWD}                            \
  lorimark/gnucashew-devkit            \
  /bin/bash

