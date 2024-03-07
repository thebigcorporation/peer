#!/usr/bin/env bash

cmake -B build -DCMAKE_BUILD_TYPE=Release
cmake --build build

pushd cran
bash create_source_new.sh
popd

pushd standalone_python
bash create_python_package.sh
popd
