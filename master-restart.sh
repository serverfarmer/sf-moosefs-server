#!/bin/sh

if [ -d /srv/mounts/moosefs/samba ]; then
	/usr/sbin/mfsmaster stop
	sleep 1
	/usr/sbin/mfsmaster start
fi
