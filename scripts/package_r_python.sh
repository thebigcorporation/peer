#!/usr/bin/env bash
set -euxo pipefail

# This will create Python and R packages for peer
# in the cran and conda_forge_python directories.
# These are being distributed via conda-forge


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd "$SCRIPT_DIR/.."

# Create an R package in cran/peer_$VERSION.tar.gz
pushd cran
# shellcheck disable=SC1091
source package_r_only.sh
popd

# Create a python package in standalone_python/peer/dist/peer-$VERSION.tar.gz
pushd conda_forge_python
# shellcheck disable=SC1091
source create_python_package.sh
popd
