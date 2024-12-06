#
# dockerfile for pmemhackathon, fc30 based
#
# Note: After making any changes to files within this directory you have to rebuild
#       the image:
#
# $ sudo docker build -t pmemhackathon/pmemfc30:09 -f ./docker/Dockerfile ./docker/
#

FROM fedora:30

LABEL maintainer="andy.rudoff@intel.com"

RUN dnf update -y && dnf install -y\
	autoconf\
	automake\
	bash-completion\
	bc\
	bind-utils\
	binutils\
	clang\
	cmake\
	daxctl-devel\
	doxygen\
	emacs\
	file\
	findutils\
	fuse\
	fuse-devel\
	gcc\
	gcc-c++\
	gdb\
	git-all\
	glib2-devel\
	golang\
	lbzip2\
	libatomic\
	libtool\
	libudev-devel\
	libunwind-devel\
	make\
	man\
	nano\
	ncurses-devel\
	ndctl-devel\
	numactl\
	numactl-devel\
	openssh-server\
	pandoc\
	passwd\
	perl-Text-Diff\
	pkgconfig\
	python3-devel\
	rpm-build\
	rpm-build-libs\
	rpmdevtools\
	rsync\
	strace\
	tar\
	tbb-devel\
	unzip\
	vim-enhanced\
	wget\
	which\
	cmake\
	jemalloc-devel\
 && dnf debuginfo-install -y glibc \
 && dnf clean all

COPY hwloc.sh /
RUN /hwloc.sh

COPY umf.sh /
RUN /umf.sh

RUN rm /hwloc.sh /umf.sh
