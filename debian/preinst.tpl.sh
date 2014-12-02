#!/bin/sh
set -e

#
# Now we have to ensure the following state:
# /etc/passwd: orientdb:x:100:101:OrientDB Server:/var/lib/orientdb:/bin/false
# /etc/group:  orientdb:x:101:
# 

# creating orientdb group if he isn't already there
if ! getent group orientdb >/dev/null; then
        # Adding system group: orientdb.
	echo "Adding system group: orientdb."
        addgroup --system orientdb >/dev/null
fi

# creating orientdb user if he isn't already there
if ! getent passwd orientdb >/dev/null; then
        # Adding system user: orientdb.
	echo "Adding system user: orientdb."
        adduser \
          --system \
          --ingroup orientdb \
          --disabled-login \
          --home /usr/share/orientdb \
          --gecos "OrientDB Server" \
          --shell /bin/false \
          orientdb  >/dev/null
fi

if [ -f /etc/init.d/orientdb ]
then
  service orientdb stop
  sleep 10
fi

exit 0
