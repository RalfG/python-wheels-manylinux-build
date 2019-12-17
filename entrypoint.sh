#!/bin/bash
#set -e -x

# CLI arguments
PY_VERSIONS=$1
BUILD_REQUIREMENTS=$2

# Compile wheels
arrPY_VERSIONS=(${PY_VERSIONS// / })
for PY_VER in "${arrPY_VERSIONS[@]}"; do
    /opt/python/${PY_VER}/bin/pip install ${BUILD_REQUIREMENTS} || { echo "\nInstalling requirements failed."; exit 1; }
    /opt/python/${PY_VER}/bin/pip wheel /github/workspace/ -w /github/workspace/wheelhouse/ || { echo "\nBuilding wheels failed."; exit 1; }
done

echo "\nSuccesfully build wheels"