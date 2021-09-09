#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv
mkdir -p pmemkv/build
pushd pmemkv/build

cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j$(nproc) install

popd
rm -r pmemkv
