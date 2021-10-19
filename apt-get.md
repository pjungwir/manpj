dpkg does the installing; apt-get manages depencendies and pulls things down from repositories.


To install a `.deb` file:
  dpkg -i foo.deb

To list installed packages:
  dpkg --list [pattern]     # pattern is something like 'wine*'

To report the status of a package:
  dpkg --status <package-name>

To list files currently installed by a package:
  dpkg --listfiles <package-name>

To look for new packages:
  apt-cache search <search-string>

To find the package containing a given file:
  apt-file search <filename>

To list what can be upgraded:
  apt list --upgradable

To upgrade only one package:
  apt-get install --only-upgrade <package>

To upgrade everything:
  apt-get upgrade
