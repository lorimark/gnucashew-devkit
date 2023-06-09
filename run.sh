#
# This runs the gnucash-devkit container, hooking it in to
#  the local file system for logging and other things.
#
#

docker run                               \
  -it                                    \
  --rm                                   \
  --net host                             \
  --privileged                           \
  --ipc=host                             \
  -u $(id -u ${USER}):$(id -g ${USER})   \
  -v /home:/home                         \
  -v /etc/passwd:/etc/passwd             \
  -v /etc/group:/etc/group               \
  -v /mnt:/mnt                           \
  -v ${HOME}/.cache/dconf:${HOME}/dconf  \
  -v /tmp/.X11-unix:/tmp/.X11-unix       \
  -v $HOME/.Xauthority:$HOME/.Xauthority \
  -e "TERM=xterm-256color"               \
  -e "DISPLAY=$DISPLAY"                  \
  -w ${PWD}                              \
  lorimark/gnucashew-devkit              \
  /bin/bash

