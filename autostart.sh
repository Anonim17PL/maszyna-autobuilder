#!/bin/bash
export BUILD_PREFIX=x86_64-w64-mingw32
export CFLAGS="-DFLAC__NO_DLL -D_FORTIFY_SOURCE=0" 
export CPPFLAGS="-DFLAC__NO_DLL -D_FORTIFY_SOURCE=0" 
export idir=$(pwd)/output/buildenv
export depsdir=$(pwd)/deps

mkdir -p output/build
mkdir -p output/buildenv
mkdir -p download
mkdir -p output/package/image

build_deps() {
  #libasio
  . ./scripts/asio.sh
  
  #libpng
  . ./scripts/zlib.sh
  . ./scripts/libpng.sh
  
  #libserialport
  . ./scripts/libserialport.sh
  
  #libglfw
  . ./scripts/glfw.sh
  
  #libglm
  . ./scripts/glm.sh
  
  #libsndfile
  . ./scripts/libogg.sh
  . ./scripts/libvorbis.sh
  . ./scripts/libflac.sh
  . ./scripts/libopus.sh
  . ./scripts/libsndfile.sh
  
  #luajit
  . ./scripts/lua.sh
}

case "$1" in
  "target") . ./scripts/target.sh ;;
  "deps") build_deps ;;
  "script") . ./scripts/$2.sh ;;
  *)
  
build_deps
. ./scripts/target.sh
