#!/bin/sh

DIR="`pwd`"
cd /var/lib/mfs

if [ ! -f metadata.mfs ] && [ -f metadata.mfs.back ]; then
	mfsmetarestore -m metadata.mfs.back -o metadata.mfs
	chown mfs:mfs metadata.mfs
	chmod 0640 metadata.mfs
fi

cd "$DIR"
