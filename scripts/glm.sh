#!/bin/bash

url="https://github.com/g-truc/glm.git"
#loc="download/"
dirloc="output/build"
adir="glm"
sdir=$(pwd)

entrydir() {
	pushd $dirloc
}

exitdir() {
	popd
}

configure() {
	git clone $url
	cd $adir
	mkdir build
	cd build
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON
}

install() {
	make -j8
	cmake --install . --prefix $idir
}

#download
#extract

entrydir
configure
install
exitdir