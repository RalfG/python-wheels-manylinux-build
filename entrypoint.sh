#!/bin/bash
#set -e -x

# CLI arguments
PY_VERSIONS=$1
BUILD_REQUIREMENTS=$2

# Compile wheels
arrPY_VERSIONS=(${PY_VERSIONS// / })
for PY_VER in "${arrPY_VERSIONS[@]}"; do
    /opt/python/${PY_VER}/bin/pip install ${BUILD_REQUIREMENTS}
    /opt/python/${PY_VER}/bin/pip wheel /io/ -w /io/wheelhouse/
done
