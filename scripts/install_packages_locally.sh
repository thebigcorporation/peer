#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "$SCRIPT_DIR/.."

# This will build and create generated SWIG files for python and R
cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

# The R package will be installed by cmake build

# Install python package. Needs python to install to on path
pushd standalone_python
bash create_python_package.sh
python -m pip install ./peer
popd
