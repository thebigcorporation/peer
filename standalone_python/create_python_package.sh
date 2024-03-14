#!/bin/bash

#1. copy template into directoyr "peer"
rm -Rf ./peer
cp -R ./peer_template ./peer

#2. create symlinks
# ln -s $(pwd)/../External/alglib/src/*.{h,cpp} ./peer/src/

ln -s $(pwd)/../include/ossolog.h ./peer/src/

ln -s $(pwd)/../External/Eigen ./peer/src/Eigen

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

ln -s $(pwd)/../python/peerPYTHON_wrap.cxx ./peer/src/peerPYTHON_wrap.cpp
ln -s $(pwd)/../python/peer.py ./peer/

python -m build --sdist peer
