#!/bin/bash

url="https://github.com/eu07/maszyna.git"
#loc="download/"
dirloc="output/build"
adir="maszyna"
sdir=$(pwd)

entrydir() {
	pushd $dirloc
}

exitdir() {
	popd
}

configure() {
	git clone $url
	patch -p1 < $sdir/eu07_knet.patch
	cd $adir
	cp $depsdir/SDKDDKVer.h ./SDKDDKVer.h
	mkdir build
	cd build
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release
}

install() {
	make -j8
	
	cp bin/eu07.exe $sdir/output/package/image/eu07.exe
	cp $sdir/output/buildenv/bin/*.dll $sdir/output/package/image/
	cp $sdir/output/buildenv/usr/local/bin/*.dll $sdir/output/package/image/
	cp $depsdir/*.dll $sdir/output/package/image/
	cp -R ../shaders $sdir/output/package/image/shaders
}

entrydir
configure
install
exitdir