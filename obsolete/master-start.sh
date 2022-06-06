#!/bin/sh

# http://www.moosefs.org/news-reader/items/metadata-ins-and-outs.html

if [ ! -d /srv/mounts/moosefs/samba ]; then
	/usr/sbin/mfsmaster start

	for S in 3 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 8 8 8 8; do
		if [ "`ps aux |grep mfsmount |grep -v grep`" = "" ]; then
			sleep $S
			/usr/bin/mfsmount /srv/mounts/moosefs
		fi
	done
fi
