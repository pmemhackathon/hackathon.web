#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv-nodejs.git
pushd pmemkv-nodejs

npm install

popd
rm -r pmemkv-nodejs
