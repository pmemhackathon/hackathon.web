#!/bin/bash -ex

git clone https://github.com/pmem/pmemkv-java.git
pushd pmemkv-java

mvn install -Dmaven.test.skip=true

popd
rm -r pmemkv-java
