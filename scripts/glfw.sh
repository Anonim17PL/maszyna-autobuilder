#!/bin/bash

url="https://github.com/glfw/glfw.git"
#loc="download/"
dirloc="output/build"
adir="glfw"
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
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_EXAMPLES=OFF -DGLFW_BUILD_TESTS=OFF -DGLFW_BUILD_DOCS=OFF
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