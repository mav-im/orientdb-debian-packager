#!/bin/sh
set -e

if [ "x$1" = "xpurge" ]
then
	rm -fr /etc/orientdb
	rm -fr /var/log/orientdb
	userdel orientdb
fi

rm -f /etc/init.d/orientdb
rm -f /etc/rc*/*orientdb

exit 0
