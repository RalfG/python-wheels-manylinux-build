# Python wheels manylinux build - GitHub Action

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/RalfG/python-wheels-manylinux-build?include_prereleases&sort=semver&style=flat-square)
![GitHub](https://img.shields.io/github/license/ralfg/manylinux-github-action?style=flat-square)
[![GitHub issues](https://img.shields.io/github/issues/RalfG/manylinux-github-action?style=flat-square)](https://github.com/RalfG/manylinux-github-action/issues)

Build manylinux wheels for a (Cython) Python package.

This action uses the [manylinux](https://github.com/pypa/manylinux) container to
build manylinux wheels for a (Cython) Python package. The wheels are placed in a
new directory `wheelhouse` and can then be uploaded to PyPI in the next step.

## Usage

### Inputs

#### python-versions

Required  
Python versions for which to build (PEP 425 tags), as described in the
[manylinux image documentation](https://github.com/pypa/manylinux). This can be
one version, or a space-separated list of items.
For example: `cp36-cp36m cp37-cp37m cp38-cp38`  
Default: `cp36-cp36m cp37-cp37m cp38-cp38`

#### build-requirements
Optional  
Packages required at build time, space-separated  
For example: `cython` or `cython==0.29.14`  


### Example usage
```yaml
uses: actions/python-wheels-manylinux-build@v0.1
with:
  python-versions: 'cp36-cp36m cp37-cp37m'
```

### Full workflow example
See
[full_workflow_example.yml](https://github.com/RalfG/python-wheels-manylinux-build/blob/master/full_workflow_example.yml) for a complete example that includes linting and
uploading to PyPI.


## Contributing
Bugs, questions or suggestions? Feel free to post an issues in the
[issue tracker](https://github.com/RalfG/python-wheels-manylinux-build/issues)
or to make a pull request!
