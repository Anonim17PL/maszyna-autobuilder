#!/bin/bash

url="https://luajit.org/git/luajit.git"
#loc="download/"
dirloc="output/build"
adir="luajit"
sdir=$(pwd)

entrydir() {
	pushd $dirloc
}

exitdir() {
	popd
}

configure() {
	git clone $url
	patch -p1 < $sdir/luajit_mingw.patch
	cd $adir
}

install() {
	make install HOST_CC="gcc" CROSS=$BUILD_PREFIX- TARGET_SYS=Windows PREFIX=$idir -j8 
}

entrydir
configure
install
exitdir
