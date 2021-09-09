#!/bin/bash -ex

git clone https://github.com/pmem/libpmemobj-cpp
mkdir -p libpmemobj-cpp/build
pushd libpmemobj-cpp/build

cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make -j$(nproc) install

popd
rm -r libpmemobj-cpp
