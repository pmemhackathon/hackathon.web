#!/bin/bash -ex

git clone https://github.com/pmem/pmdk
pushd pmdk

make -j$(nproc)
make -j$(nproc) install prefix=/usr

popd
rm -r pmdk
