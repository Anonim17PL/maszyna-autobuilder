#!/bin/bash

url="http://prdownloads.sourceforge.net/libpng/libpng-1.6.44.tar.xz?download"
loc="download/libpng.tar.xz"
dirloc="output/build"
adir="libpng-1.6.44"
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
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release -DZLIB_LIBRARY=$idir/usr/local/lib/libzlibstatic.a -DZLIB_INCLUDE_DIR=$idir/usr/local/include
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