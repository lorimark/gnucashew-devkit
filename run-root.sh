#
# This runs the gnucash-devkit container, hooking it in to
#  the local file system for logging and other things.
#
#

docker run                               \
  -it                                    \
  --rm                                   \
  --net host                             \
  -v /tmp/.X11-unix:/tmp/.X11-unix       \
  -v $HOME/.Xauthority:/root/.Xauthority \
  -e "TERM=xterm-256color"               \
  -e "DISPLAY=$DISPLAY"                  \
  lorimark/gnucashew-devkit              \
  /bin/bash

