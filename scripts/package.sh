#!/bin/bash

dirloc="output/package/image"
idate=$(date '+%Y-%m-%d')

entrydir() {
	pushd $dirloc
}

exitdir() {
	popd
}

image() {
	zip ../eu07_x64-$idate.zip *
}

entrydir
image
exitdir

