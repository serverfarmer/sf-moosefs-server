#!/bin/sh
# multiple chunkservers on single host: https://github.com/lizardfs/lizardfs/issues/231

INSTANCES="`cat /etc/mfs/instances.cfg 2>/dev/null`"

OK="1"
for I in $INSTANCES; do
	for D in `cat /etc/mfs/mfshdd-$I.cfg |grep -v ^# |sed s/\*//g`; do
		if [ ! -d $D ]; then
			echo "directory $D not mounted, skipping moosefs initialization"
			OK="0"
		fi
	done
done

if [ "$OK" = "1" ]; then
	for I in $INSTANCES; do
		if [ "`ps aux |grep /usr/sbin/mfschunkserver |grep mfschunkserver-$I.cfg |grep -v grep`" = "" ]; then
			/usr/sbin/mfschunkserver -c /etc/mfs/mfschunkserver-$I.cfg start
			sleep 1
		fi
	done
fi
