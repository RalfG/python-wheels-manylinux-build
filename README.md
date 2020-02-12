# Python wheels manylinux build - GitHub Action

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/RalfG/python-wheels-manylinux-build?include_prereleases&style=flat-square)
![GitHub](https://img.shields.io/github/license/ralfg/manylinux-github-action?style=flat-square)
[![GitHub issues](https://img.shields.io/github/issues/RalfG/manylinux-github-action?style=flat-square)](https://github.com/RalfG/manylinux-github-action/issues)

Build manylinux wheels for a (Cython) Python package.

This action uses the [manylinux](https://github.com/pypa/manylinux) containers to
build manylinux wheels for a (Cython) Python package. The wheels are placed in a
new directory `wheelhouse` and can then be uploaded to PyPI in the next step of your
workflow.

## Usage

### Inputs

#### python-versions (required)
Python versions for which to build (PEP 425 tags), as described in the
[manylinux image documentation](https://github.com/pypa/manylinux). This can be
one version, or a space-separated list of items.

For example: `cp36-cp36m cp37-cp37m cp38-cp38`  
Default: `cp36-cp36m cp37-cp37m cp38-cp38`

Possible version tags (as of the 12th of December 2019): `cp27-cp27m`, `cp27-cp27mu`,
`cp34-cp34m`, `cp35-cp35m`, `cp36-cp36m`, `cp37-cp37m`, `cp38-cp38`

#### build-requirements (optional)
Python (pip) packages required at build time, space-separated  
For example: `cython` or `cython==0.29.14`

#### system-packages (optional)
System (yum) packages required at build time, space-separated  
For example: `lrzip-devel zlib-devel`

#### package-path (optional)
Path to python package to build (e.g. where `setup.py` file is located), relative to
repository root  
For example: `my_project`

### Output
The action will create wheels in a new `wheelhouse` directory. Be sure to upload
only the `wheelhouse/*-manylinux*.whl` wheels, as the non-audited (e.g. `linux_x86_64`)
wheels are not accepted by PyPI.

### Using a different manylinux container
By default, the `manylinux2010_x86_64` container is used. To use another manylinux
container, append `-<container-name>` to the reference. For example:
`@v0.2-manylinux2014_aarch64` instead of `@v0.2`.

### Example usage
Minimal:

```yaml
uses: RalfG/python-wheels-manylinux-build@v0.2
with:
  python-versions: 'cp36-cp36m cp37-cp37m'
```

Using all arguments:

```yaml
uses: RalfG/python-wheels-manylinux-build@v0.2-manylinux2010_x86_64
with:
  python-versions: 'cp36-cp36m cp37-cp37m'
  build-requirements: 'cython numpy'
  system-packages: 'lrzip-devel zlib-devel'
  package-path: 'my_project'
```

See
[full_workflow_example.yml](https://github.com/RalfG/python-wheels-manylinux-build/blob/master/full_workflow_example.yml)
for a complete example that includes linting and uploading to PyPI.

## Contributing
Bugs, questions or suggestions? Feel free to post an issue in the
[issue tracker](https://github.com/RalfG/python-wheels-manylinux-build/issues)
or to make a pull request!
