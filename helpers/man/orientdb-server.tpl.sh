#!/bin/bash

if [ "x$1" = "x--help" ]
then
	echo "OrientDB is a open source powerful Object, Document, no-sql, Graph Database written in Java.
The orientdb_server command is a startup wrapper used by orient to bring up the server instance (java).

You don't need to call this file directly.

NOTE: OrientDB is free software. For more informations subscribe to the orientdb mailinglist
"
fi

if [ "x$1" = "x--version" ]
then
	echo "%VERSION%"
fi

