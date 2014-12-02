#!/bin/bash

if [ "x$1" = "x--help" ]
then
	echo "OrientDB is a open source powerful Object, Document, no-sql, Graph Database written in Java.
With the orientdb_console command you can enter into the cli console.

For more information on the console commands and usage you can read http://code.google.com/p/orient/wiki/ConsoleCommands

NOTE: OrientDB is free software. For more informations subscribe to the orientdb mailinglist
"
fi

if [ "x$1" = "x--version" ]
then
	echo "%VERSION%"
fi

