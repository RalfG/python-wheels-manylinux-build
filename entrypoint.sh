#!/bin/bash
set -e -x

# CLI arguments
PY_VERSIONS=$1
BUILD_REQUIREMENTS=$2
SYSTEM_PACKAGES=$3
PRE_BUILD_COMMAND=$4
PACKAGE_PATH=$5
PIP_WHEEL_ARGS=$6

cd /github/workspace/"${PACKAGE_PATH}"

if [ ! -z "$SYSTEM_PACKAGES" ]; then
    yum install -y ${SYSTEM_PACKAGES}  || { echo "Installing yum package(s) failed."; exit 1; }
fi

if [ ! -z "$PRE_BUILD_COMMAND" ]; then
    $PRE_BUILD_COMMAND || { echo "Pre-build command failed."; exit 1; }
fi

# Compile wheels
arrPY_VERSIONS=(${PY_VERSIONS// / })
for PY_VER in "${arrPY_VERSIONS[@]}"; do
    # Update pip
    /opt/python/"${PY_VER}"/bin/pip install --upgrade --no-cache-dir pip

    # Check if requirements were passed
    if [ ! -z "$BUILD_REQUIREMENTS" ]; then
        /opt/python/"${PY_VER}"/bin/pip install --no-cache-dir ${BUILD_REQUIREMENTS} || { echo "Installing requirements failed."; exit 1; }
    fi

    # Build wheels
    /opt/python/"${PY_VER}"/bin/pip wheel . ${PIP_WHEEL_ARGS} || { echo "Building wheels failed."; exit 1; }
done

# Bundle external shared libraries into the wheels
find . -type f -iname "*-linux*.whl" -execdir sh -c "auditwheel repair '{}' -w ./ --plat '${PLAT}' || { echo 'Repairing wheels failed.'; auditwheel show '{}'; exit 1; }" \;

echo "Succesfully build wheels:"
find . -type f -iname "*-manylinux*.whl"
