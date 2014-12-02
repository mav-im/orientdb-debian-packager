#!/bin/sh

echo "           .                                          "
echo "          .\`        \`                                 "
echo "          ,      \`:.                                  "
echo "         \`,\`    ,:\`                                   "
echo "         .,.   :,,                                    "
echo "         .,,  ,,,                                     "
echo "    .    .,.:::::  \`\`\`\`                                 :::::::::     :::::::::   "
echo "    ,\`   .::,,,,::.,,,,,,\`;;                      .:    ::::::::::    :::    :::  "
echo "    \`,.  ::,,,,,,,:.,,.\`  \`                       .:    :::      :::  :::     ::: "
echo "     ,,:,:,,,,,,,,::.   \`        \`         \`\`     .:    :::      :::  :::     ::: "
echo "      ,,:.,,,,,,,,,: \`::, ,,   ::,::\`   : :,::\`  ::::   :::      :::  :::    :::  "
echo "       ,:,,,,,,,,,,::,:   ,,  :.    :   ::    :   .:    :::      :::  :::::::     "
echo "        :,,,,,,,,,,:,::   ,,  :      :  :     :   .:    :::      :::  :::::::::   "
echo "  \`     :,,,,,,,,,,:,::,  ,, .::::::::  :     :   .:    :::      :::  :::     ::: "
echo "  \`,...,,:,,,,,,,,,: .:,. ,, ,,         :     :   .:    :::      :::  :::     ::: "
echo "    .,,,,::,,,,,,,:  \`: , ,,  :     \`   :     :   .:    :::      :::  :::     ::: "
echo "      ...,::,,,,::.. \`:  .,,  :,    :   :     :   .:    :::::::::::   :::     ::: "
echo "           ,::::,,,. \`:   ,,   :::::    :     :   .:    :::::::::     ::::::::::  "
echo "           ,,:\` \`,,.                                  "
echo "          ,,,    .,\`                                  "
echo "         ,,.     \`,                                          GRAPH DATABASE  "
echo "       \`\`        \`.                                          DISTRIBUTED   "
echo "                 \`\`                                         www.orientdb.org "
echo "                 \`                                    "

VERSION="%VERSION%"
BUILD="UNKNOWN@r${buildNumber}; %BUILD%"

ORIENTDB_HOME=/usr/share/orientdb
ORIENTDB_CONF_PATH=/etc/orientdb

ORIENTDB_SETTINGS="-Dprofiler.enabled=true -Dcache.level1.enabled=false -Dcache.level2.enabled=false -Djava.util.logging.config.file="${ORIENTDB_CONF_PATH}/orientdb-server-log.properties" -Dorientdb.config.file="${ORIENTDB_CONF_PATH}/orientdb-dserver-config.xml" -Dorientdb.www.path="${ORIENTDB_HOME}/www
JAVA_OPTS_SCRIPT="-XX:+HeapDumpOnOutOfMemoryError -Djava.awt.headless=true -Dfile.encoding=UTF8 -Drhino.opt.level=9"

# Set JavaHome if it exists
if [ -f "${JAVA_HOME}/bin/java" ]; then
   JAVA=${JAVA_HOME}/bin/java
else
   JAVA=java
fi
export JAVA

${JAVA} -server ${JAVA_OPTS} ${JAVA_OPTS_SCRIPT} ${ORIENTDB_SETTINGS} -Dorientdb.build.number="${BUILD}" -cp "${ORIENTDB_HOME}/lib/orientdb-server-${VERSION}.jar:${ORIENTDB_HOME}/lib/*" com.orientechnologies.orient.server.OServerMain