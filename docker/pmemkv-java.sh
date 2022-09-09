#!/bin/bash -ex

# Include setup of extra maven parameters (proxies)
source /setup-maven-settings.sh

MVN_PARAMS="${PMEMKV_MVN_PARAMS}"
echo "Extra mvn params (taken from env variable): ${MVN_PARAMS}"

git clone https://github.com/pmem/pmemkv-java.git
pushd pmemkv-java

mvn install -Dmaven.test.skip=true ${MVN_PARAMS}

popd
rm -r pmemkv-java
