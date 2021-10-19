# UTILITIES

- xlsfonts:
  lists all the fonts on your system.

  *xlsfonts* -ll -fn *font-name*

  gives you detailed information about a font.

- chkfontpath:
  RedHat utility for managing directories in the X font server's path.

- ttmkfdir:
  creates an index of X font files in a directory for TrueType fonts.

- mkfontdir:
  creates an index of X font files in a directory.

- gnome-font-viewer:
  Shows what a font looks like.

To install new fonts (on Fedora Core 5), put them in a new directory in `/usr/share/fonts/`.
Inside that directory, run `ttmkfdir` and then `mkfontdir`.
Edit `/etc/X11/fs/config` and change the font path to include your directory.
Finally, restart the font server.
