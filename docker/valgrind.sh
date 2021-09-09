#!/bin/bash -ex

git clone https://github.com/pmem/valgrind.git
pushd valgrind

./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) install

popd
rm -r valgrind
