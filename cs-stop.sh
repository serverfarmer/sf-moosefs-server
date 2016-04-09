#!/bin/sh

INSTANCES="`cat /etc/mfs/instances.cfg 2>/dev/null`"

for I in $INSTANCES; do
	/usr/sbin/mfschunkserver -c /etc/mfs/mfschunkserver-$I.cfg stop
done
