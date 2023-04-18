#!/bin/bash -ex

git clone https://github.com/open-mpi/hwloc.git
cd hwloc

./autogen.sh
./configure --prefix=/usr
make -j$(nproc)
make -j$(nproc) install 

