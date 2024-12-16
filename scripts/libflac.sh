#!/bin/bash

url="https://downloads.xiph.org/releases/flac/flac-1.4.3.tar.xz"
loc="download/flac.tar.xz"
dirloc="output/build"
adir="flac-1.4.3"
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
	./configure --prefix $idir --host=$BUILD_PREFIX --with-ogg-includes=$idir/include --with-ogg-libraries==$idir/lib \
	--disable-oggtest --disable-shared --disable-fortify-source --disable-stack-smash-protection --disable-tests --disable-exaples --disable-examples --disable-docs
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