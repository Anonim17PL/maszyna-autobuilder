#!/bin/bash

url="https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.xz"
loc="download/libvorbis.tar.xz"
dirloc="output/build"
adir="libvorbis-1.3.7"
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
	./configure --prefix $idir --host=$BUILD_PREFIX --with-ogg-includes=$idir/include --with-ogg-libraries==$idir/lib --disable-oggtest  --disable-tests --disable-exaples --disable-examples --disable-docs
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