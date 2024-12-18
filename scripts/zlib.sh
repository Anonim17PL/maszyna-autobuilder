#!/bin/bash

url="https://zlib.net/zlib-1.3.1.tar.gz"
loc="download/zlib.tar.gz"
dirloc="output/build"
adir="zlib-1.3.1"
sdir=$(pwd)

download() {
	wget $url -O $loc
}

extract() {
	tar -xf $loc -C $dirloc
}

entrydir() {
	pushd $dirloc/$adir
}

exitdir() {
	popd
}

configure() {
	mkdir build
	cd build
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release
}

install() {
	make -j8
	make install DESTDIR=$idir
}

download
extract

entrydir
configure
install
exitdir