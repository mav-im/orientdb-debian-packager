orientdb-debian-packager
========================

Deb-packager for the Java compiled OrientDB server.

# Usage

1. Download tar.gz archive with compiled Java files from [download page](http://www.orientechnologies.com/download/)

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