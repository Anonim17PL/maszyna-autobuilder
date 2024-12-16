#!/bin/bash

url="https://github.com/libsndfile/libsndfile.git"
#loc="download/"
dirloc="output/build"
adir="libsndfile"
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
	cmake .. -DCMAKE_TOOLCHAIN_FILE=$sdir/mingw64.cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_EXTERNAL_LIBS=true -DBUILD_SHARED_LIBS=true \
	-DOGG_LIBRARY=$idir/lib/libogg.a -DOGG_INCLUDE_DIR=$idir/include \
	-DVorbis_Vorbis_LIBRARY=$idir/lib/libvorbis.a -DVorbis_Vorbis_INCLUDE_DIR=$idir/include \
	-DVorbis_Enc_LIBRARY=$idir/lib/libvorbisenc.a -DVorbis_Enc_INCLUDE_DIR=$idir/include \
	-DVorbis_File_LIBRARY=$idir/lib/libvorbisfile.a -DVorbis_File_INCLUDE_DIR=$idir/include \
	-DFLAC_LIBRARY=$idir/lib/libFLAC.a -DFLAC_INCLUDE_DIR=$idir/include \
	-DOPUS_LIBRARY=$idir/lib/libopus.a -DOPUS_INCLUDE_DIR=$idir/include \
	-DBUILD_TESTING=OFF -DBUILD_PROGRAMS=OFF -DBUILD_EXAMPLES=OFF
}

install() {
	make -j16
	cmake --install . --prefix $idir
}

entrydir
configure
install
exitdir