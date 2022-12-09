#
# dockerfile for pmemhackathon, centos8-stream based
#
# Note: After making any changes to files within this directory you have to rebuild
#       the image:
#
# $ sudo docker build -t pmemhackathon/centos8:X -f ./docker/Dockerfile ./docker/
#

FROM quay.io/centos/centos:stream8

LABEL maintainer="igor.chorazewicz@intel.com"

RUN dnf install -y \
	cmake \
	sudo \
	git \
	tzdata \
	vim \
	gdb \
	clang \
	python36 \
	glibc-devel.i686 \
	autoconf \
	automake \
	daxctl-devel \
	gcc \
	gcc-c++ \
	git-all \
	numactl \
	numactl-devel \
	libtool

COPY ./cachelib-pre.sh ./cachelib-pre.sh
RUN ./cachelib-pre.sh

COPY ./cachelib.sh ./cachelib.sh
RUN ./cachelib.sh

COPY ./hwloc.sh ./hwloc.sh
RUN ./hwloc.sh

COPY ./memkind.sh ./memkind.sh
RUN ./memkind.sh

RUN dnf install -y pcm
