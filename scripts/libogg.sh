#!/bin/bash

url="https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz"
loc="download/libogg.tar.gz"
dirloc="output/build"
adir="libogg-1.3.5"
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
	./configure --prefix $idir --host=$BUILD_PREFIX  --disable-tests --disable-exaples --disable-examples --disable-docs
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