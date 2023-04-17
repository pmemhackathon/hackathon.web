#!/bin/bash -ex

git clone -b develop https://github.com/intel/CacheLib CacheLib

cd CacheLib

git checkout f4e30a7f3c878bc119577a11d2ca69c72d41a925

./contrib/prerequisites-centos8.sh

for pkg in zstd googleflags googlelog googletest sparsemap fmt folly fizz wangle fbthrift ;
do
    ./contrib/build-package.sh -j -I /opt/ "$pkg"
done

cd ..
rm -rf CacheLib
