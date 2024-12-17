#!/bin/bash

url="https://github.com/sigrokproject/libserialport.git"
#loc="download/"
dirloc="output/build"
adir="libserialport"
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
	./autogen.sh
	./configure --prefix $idir --host=$BUILD_PREFIX
}

install() {
	make -j8
	make install
}

entrydir
configure
install
exitdir
