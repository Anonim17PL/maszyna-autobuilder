#!/bin/bash

url="https://sourceforge.net/projects/asio/files/asio/1.30.2%20%28Stable%29/asio-1.30.2.tar.gz"
loc="download/asio.tar.gz"
dirloc="output/build"
adir="asio-1.30.2"
sdir="$(pwd)"

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

#configure() {
#
#}

install() {
	cp -R include/. $idir/include
}

download
extract

entrydir
#configure
install
exitdir
