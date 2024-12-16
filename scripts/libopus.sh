#!/bin/bash

url="https://downloads.xiph.org/releases/opus/opus-1.5.2.tar.gz"
loc="download/opus.tar.gz"
dirloc="output/build"
adir="opus-1.5.2"
sdir=$(pwd)

download() {
	wget $url -O $loc
}

extract() {
	tar -xf $loc -C $dirloc
}

entrydir() {
	pushd $dirloc
}

exitdir() {
	popd
}

configure() {
	cd $adir
	./configure --prefix $idir --host=$BUILD_PREFIX --disable-doc --disable-hardening --disable-extra-programs  --disable-tests --disable-exaples --disable-examples --disable-docs
}

install() {
	make -j8
	make install
}

download
extract

entrydir
configure
install
exitdir