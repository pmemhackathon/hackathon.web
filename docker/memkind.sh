#!/bin/bash -ex

git clone https://github.com/memkind/memkind
pushd memkind

./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) install

popd
rm -r memkind
