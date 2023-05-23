# Run GnuCash in a container
#

#
#
FROM lorimark/gnucash-devkit
LABEL description "gnucashew-devkit"
LABEL maintainer "Mark Petryk <mark@lorimarksolutions.com>"

RUN export DEBIAN_FRONTEND=noninteractive

#
# clone gnucash so we have all its sources on hand
#
RUN git clone https://github.com/Gnucash/gnucash.git /usr/src/gnucash

#
# add things to the image needed for Wt development
#
RUN apt-get update -q              \
 && apt-get install -y -q          \
      libboost-all-dev             \
      doxygen                      \
      imagemagick                  \
      graphicsmagick               \
      libssl-dev                   \
      libgraphicsmagick++1-dev     \
      libhpdf-dev                  \
      libpango1.0-dev              \
      libghc-openglraw-dev         \
      freeglut3-dev

#
# clone Wt 
#
RUN git clone https://github.com/emweb/wt.git /usr/src/Wt4

#
# clone Wtx
#
RUN git clone https://github.com/lorimark/Wtx /usr/src/Wtx

#
# compile and install Wt
#
RUN mkdir -p /tmp/Wt4/build \
 && cd       /tmp/Wt4/build \
 && cmake \
     -DCMAKE_INSTALL_PREFIX=/opt/Wt4 \
     -DWT_WRASTERIMAGE_IMPLEMENTATION=GraphicsMagick \
     -DCONNECTOR_FCGI=OFF \
     -DENABLE_HARU=TRUE \
     /usr/src/Wt4 \
 && make -j 4 \
 && make install

#
# Copy everything else out from 'root' that we want in the image.
#
COPY root /

