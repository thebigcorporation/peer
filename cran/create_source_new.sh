#!/bin/bash
# Build an R source package for peer

#1. copy template into directoyr "peer"
rm -Rf ./peer
cp -R ./peer_template ./peer

#2. create symlinks
# ln -s $(pwd)/../External/alglib/src/*.{h,cpp} ./peer/src/

ln -s $(pwd)/../include/ossolog.h ./peer/src/

# ln -s $(pwd)/../External/Eigen ./peer/src/Eigen

ln -s $(pwd)/../src/array_helper.cpp ./peer/src/
ln -s $(pwd)/../include/array_helper.h ./peer/src/
ln -s $(pwd)/../src/bayesnet.cpp ./peer/src/
ln -s $(pwd)/../include/bayesnet.h ./peer/src/
ln -s $(pwd)/../src/sim.cpp ./peer/src/
ln -s $(pwd)/../include/sim.h ./peer/src/
ln -s $(pwd)/../src/sparsefa.cpp ./peer/src/
ln -s $(pwd)/../include/sparsefa.h ./peer/src/
ln -s $(pwd)/../src/vbfa.cpp ./peer/src/
ln -s $(pwd)/../include/vbfa.h ./peer/src/

ln -s $(pwd)/../build/R/peer/src/peerR_wrap.cpp ./peer/src/peerR_wrap.cpp
ln -s $(pwd)/../build/R/peer/R/peer.R ./peer/R/peer.R

#we don't need the so in there..
#ln -s $(pwd)/../build/R/libpeer.so ./peer/src/libpeer.so

ln -s $(pwd)/../R/peer/man ./peer/man
ln -s $(pwd)/../R/peer/NAMESPACE ./peer/NAMESPACE
ln -s $(pwd)/../R/peer/DESCRIPTION ./peer/DESCRIPTION
ln -s $(pwd)/../R/peer/R/plot.R ./peer/R/plot.R

#3. create .tar.gz with symlinks dereferenced
R CMD build peer
