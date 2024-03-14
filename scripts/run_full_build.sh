#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "$SCRIPT_DIR/.."

cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

# Create an R package in cran/peer_$VERSION.tar.gz
pushd cran
bash create_source_new.sh
popd

# Create a python package in standalone_python/peer/dist/peer-$VERSION.tar.gz
pushd standalone_python
bash create_python_package.sh
popd
