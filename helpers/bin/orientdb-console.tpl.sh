#!/bin/sh

VERSION="%VERSION%"
BUILD="UNKNOWN@r${buildNumber}; %BUILD%"

ORIENTDB_HOME=/usr/share/orientdb
ORIENTDB_CONF_PATH=/etc/orientdb

ORIENTDB_SETTINGS="-Dcache.level1.enabled=false -Dcache.level2.enabled=false -Djava.util.logging.config.file="${ORIENTDB_CONF_PATH}/orientdb-client-log.properties" -Djava.awt.headless=true"
KEYSTORE=${ORIENTDB_CONF_PATH}/cert/orientdb-console.ks
KEYSTORE_PASS=password
TRUSTSTORE=${ORIENTDB_CONF_PATH}/cert/orientdb-console.ts
TRUSTSTORE_PASS=password
SSL_OPTS="-Dclient.ssl.enabled=false -Djavax.net.ssl.keyStore=${KEYSTORE} -Djavax.net.ssl.keyStorePassword=${KEYSTORE_PASS} -Djavax.net.ssl.trustStore=${TRUSTSTORE} -Djavax.net.ssl.trustStorePassword=${TRUSTSTORE_PASS}"

#JAVA_OPTS=-Xmx1024m

# Set JavaHome if it exists
if [ -f "${JAVA_HOME}/bin/java" ]; then
   JAVA=${JAVA_HOME}/bin/java
else
   JAVA=java
fi
export JAVA

${JAVA} -client ${JAVA_OPTS} ${ORIENTDB_SETTINGS} ${SSL_OPTS} -Dfile.encoding=utf-8 -Dorientdb.build.number="${BUILD}" -cp "${ORIENTDB_HOME}/lib/orientdb-tools-${VERSION}.jar:${ORIENTDB_HOME}/lib/*" com.orientechnologies.orient.graph.console.OGremlinConsole $*