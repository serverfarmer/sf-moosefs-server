#!/bin/sh

umount /srv/mounts/moosefs
sleep 1

if [ ! -d /srv/mounts/moosefs/samba ]; then
	/usr/sbin/mfsmaster stop
fi
