orientdb-debian-packager
========================

Deb-packager for the Java compiled OrientDB server.
This script is based on Dino Ciuffetti scripts taken [here](https://groups.google.com/forum/#!topic/orient-database/vcHXWOyT4oI) and tested with OrientDB community edition v1.7.10.
Should work normaly with all 1.7.x versions.

# Usage

1. Download OrientDB tar.gz archive with compiled Java files from [download page](http://www.orientechnologies.com/download/)

2. Run mkpkg-orientdb script:
```bash
$ ./mkpkg-orientdb <path_to_archive.tar.gz>
```

3. Install package:
```bash
# dpkg -i orientdb-server_VERSION_all.deb
```

4. Init script will be added to /etc/init.d and you can run OrientDB server with command: 
```bash
# service orientdb start
```
Config files are located in /etc/orientdb