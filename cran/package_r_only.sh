#!/bin/bash
set -euxo pipefail
# Build an R source package for peer
# This package depends on BH and RcppEigen from CRAN
# Output will be in peer_$VERSION.tar.gz

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "$SCRIPT_DIR"

#0. Run swig to create R interface
pushd ../R
swig -r -c++ -I../include -o peerR_wrap.cpp peer.i
popd

#1. copy template into directory "peer"
rm -Rf ./peer
cp -R ./peer_template ./peer

#2. create symlinks
ln -s $(pwd)/../include/ossolog.h ./peer/src/
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

ln -s $(pwd)/../R/peerR_wrap.cpp ./peer/src/peerR_wrap.cpp
ln -s $(pwd)/../R/peer.R ./peer/R/peer.R

ln -s $(pwd)/../R/peer/man ./peer/man
ln -s $(pwd)/../R/peer/NAMESPACE ./peer/NAMESPACE
ln -s $(pwd)/../R/peer/R/plot.R ./peer/R/plot.R

ln -s $(pwd)/../LICENSE ./peer/

#3. create .tar.gz with symlinks dereferenced
R CMD build peer

popd
