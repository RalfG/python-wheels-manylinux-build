# Python wheels manylinux build - GitHub Action

![GitHub](https://img.shields.io/github/license/ralfg/manylinux-github-action?style=flat-square)
[![GitHub issues](https://img.shields.io/github/issues/RalfG/manylinux-github-action?style=flat-square)](https://github.com/RalfG/manylinux-github-action/issues)

Build manylinux wheels for a (Cython) Python package.

This action uses the [manylinux](https://github.com/pypa/manylinux) container to
build manylinux wheels for a (Cython) Python package. These wheels can then be
uploaded to PyPI.

## Inputs

### python-versions

**Required** Python versions to target, space-separated.

Python versions for which to build (PEP 425 tags), as described in the
[manylinux image documentation](https://github.com/pypa/manylinux). This can be
one version, or a space-separated list of items.

For example: `cp36-cp36m cp37-cp37m cp38-cp38`
Default: `cp36-cp36m cp37-cp37m cp38-cp38`

### build-requirements
**Optional** Packages required at build time, space-separated

For example: `cython` or `cython==0.29.14`
Default: /


## Example usage
```yaml
uses: actions/python-wheels-manylinux-build@v0.1
with:
  python-versions: `cp36-cp36m cp37-cp37m'
```
