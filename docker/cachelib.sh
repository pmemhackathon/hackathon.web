#!/bin/bash -ex

echo 'Defaults    env_keep += "HTTPS_PROXY https_proxy HTTP_PROXY http_proxy NO_PROXY no_proxy"' >> /etc/sudoers

git clone https://github.com/intel/CacheLib.git
cd CacheLib
git switch develop
./contrib/build.sh -d -j -v
cd ..
