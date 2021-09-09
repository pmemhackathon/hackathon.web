#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv-python.git
pushd pmemkv-python

python3 setup.py install

popd
rm -r pmemkv-python
