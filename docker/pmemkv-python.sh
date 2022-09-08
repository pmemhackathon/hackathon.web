#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv-python.git
cd pmemkv-python
python3 setup.py install
cd ..
rm -r pmemkv-python
