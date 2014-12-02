#!/bin/sh
### BEGIN INIT INFO
# Provides:          orientdb-server
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: OrientDB server init script
### END INIT INFO
# Author: Alexander Milke <milke.av@gmail.com>
# OrientDB init script

ORIENTDB_DIR="%ORIENTDB_DIR%"
ORIENTDB_USER="%ORIENTDB_USER%"

usage() {
  echo "Usage: `basename $0`: <start|stop|status>"
  exit 1
}

start() {
  status
  if [ ${PID} -gt 0 ]
  then
          echo "OrientDB server daemon was already started. PID: ${PID}"
          return ${PID}
  fi
  echo "Starting OrientDB server daemon..."
  start-stop-daemon --start --oknodo --user ${ORIENTDB_USER} --group ${ORIENTDB_USER} --pidfile /var/run/orientdb.pid --background --chdir "${ORIENTDB_DIR}" --startas "/usr/bin/orientdb-server" --chuid ${ORIENTDB_USER} --
}

stop() {
  status
  if [ ${PID} -eq 0 ]
  then
          echo "OrientDB server daemon is already not running"
          return 0
  fi
  echo "Stopping OrientDB server daemon..."

  echo ${PID} > /var/run/orientdb.pid
  start-stop-daemon --stop --oknodo --user ${ORIENTDB_USER} --group ${ORIENTDB_USER} --pidfile /var/run/orientdb.pid --signal 15 --chuid ${ORIENTDB_USER} --
}

status() {
  PID=`ps -ef | grep 'orientdb.www.path' | grep java | grep -v grep | awk '{print $2}'`
  if [ "x$PID" = "x" ]
  then
          PID=0
  fi

  # if PID is greater than 0 then OrientDB is running, else it is not
  return ${PID}
}

if [ "x$1" = "xstart" ]
then
  start
  exit 0
fi

if [ "x$1" = "xstop" ]
then
  stop
  exit 0
fi

if [ "x$1" = "xstatus" ]
then
  status
  if [ ${PID} -gt 0 ]
  then
          echo "OrientDB server daemon is running with PID: ${PID}"
  else
          echo "OrientDB server daemon is NOT running"
  fi
  exit ${PID}
fi

usage