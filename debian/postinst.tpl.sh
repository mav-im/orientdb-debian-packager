#!/bin/sh
set -e

if [ "$1" = "configure" ]; then
	if [ ! -f "/etc/orientdb/orientdb-server-log.properties" ]
	then
		# The configuration file /etc/orientdb/orientdb-server-log.properties does not already exist
		cat /usr/share/doc/orientdb/examples/orientdb-server-log.properties.gz | gunzip > /etc/orientdb/orientdb-server-log.properties
	else
		echo "An old configuration file was found: /etc/orientdb/orientdb-server-log.properties"
		echo "We are not touching the file. You could have to modify it by yourself"
	fi

	if [ ! -f "/etc/orientdb/orientdb-client-log.properties" ]
	then
		# The configuration file /etc/orientdb/orientdb-client-log.properties does not already exist
		cat /usr/share/doc/orientdb/examples/orientdb-client-log.properties.gz | gunzip > /etc/orientdb/orientdb-client-log.properties
	else
		echo "An old configuration file was found: /etc/orientdb/orientdb-client-log.properties"
		echo "We are not touching the file. You could have to modify it by yourself"
	fi

	if [ ! -f "/etc/orientdb/orientdb-server-config.xml" ]
	then
		# The configuration file /etc/orientdb/orientdb-server-config.xml does not already exist
		cat /usr/share/doc/orientdb/examples/orientdb-server-config.xml.gz | gunzip > /etc/orientdb/orientdb-server-config.xml
		chmod 640 /etc/orientdb/orientdb-server-config.xml
	else
		echo "An old configuration file was found: /etc/orientdb/orientdb-server-config.xml"
		echo "We are not touching the file. You could have to modify it by yourself"
	fi

	if [ ! -f "/etc/orientdb/orientdb-dserver-config.xml" ]
	then
		# The configuration file /etc/orientdb/orientdb-dserver-config.xml does not already exist
		cat /usr/share/doc/orientdb/examples/orientdb-dserver-config.xml.gz | gunzip > /etc/orientdb/orientdb-dserver-config.xml
		chmod 640 /etc/orientdb/orientdb-dserver-config.xml
	else
		echo "An old configuration file was found: /etc/orientdb/orientdb-dserver-config.xml"
		echo "We are not touching the file. You could have to modify it by yourself"
	fi

	update-rc.d orientdb defaults
	
	echo 
	echo "To start orientdb run:"
	echo "# service orientdb start"
	echo
	echo "To stop orientdb run:"
	echo "# service orientdb stop"
	echo 
	echo "To get the orientdb status run:"
	echo "# service orientdb status"
	echo
	echo "To use the console run:"
	echo "# orientdb-console"
	echo
	echo "NOTE: OrientDB is free software. For more informations subscribe to the orientdb mailinglist"
	
	chown -R orientdb:orientdb /var/lib/orientdb /etc/orientdb/* /var/log/orientdb
	chown -R orientdb:orientdb /usr/share/orientdb/databases /usr/share/orientdb/config /usr/share/orientdb/log
fi
