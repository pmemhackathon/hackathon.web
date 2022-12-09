#!/bin/bash -ex

git clone -b develop https://github.com/intel/CacheLib CacheLib

cd CacheLib

git checkout f4e30a7f3c878bc119577a11d2ca69c72d41a925

mkdir build
cd build

CXX=clang++ CC=clang cmake ../cachelib -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/opt -DCMAKE_BUILD_TESTS=0
make install

cd ../..
rm -rf CacheLib
