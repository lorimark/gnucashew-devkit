set -x

#
# PEAMBLE:
#
# Before building the container, copy any local-system files
#  in to the context image so they can be copied in to the
#  container
#

#
# copy the README.md file
#
# keep a copy of the README in the docker image
#
cp README.md context/root

#
# build the docker image
#
# Everything that is in the container is found in the 'context' subfolder
#  of this project directory.  In 'context' is the Dockerfile and 
#  everything else necessary for this build.
#
echo "building docker devtools image"
docker build -t="lorimark/gnucashew-devkit" context


