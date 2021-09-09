#!/bin/bash -ex

#fc30 timedatectl bug workaround:
pushd /etc
rm localtime
ln -s ../usr/share/zoneinfo/PST8PDT localtime
popd
