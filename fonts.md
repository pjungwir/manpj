.TH fonts pj "3 July 2005"
.SH NAME
fonts

.SH UTILITIES
.TP
.B xlsfonts
lists all the fonts on your system.
.TP
\fBxlsfonts\fR -ll -fn \fIfont-name\fR
gives you detailed information about a font.
.TP
.B chkfontpath
RedHat utility for managing directories in the X font server's path.
.TP
.B ttmkfdir
creates an index of X font files in a directory for TrueType fonts.
.TP
.B mkfontdir
creates an index of X font files in a directory.
.TP
.B gnome-font-viewer
Shows what a font looks like.

.PP
To install new fonts (on Fedora Core 5), put them in a new directory in /usr/share/fonts/.
Inside that directory, run ttmkfdir and then mkfontdir.
Edit /etc/X11/fs/config and change the font path to include your directory.
Finally, restart the font server.

.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth
