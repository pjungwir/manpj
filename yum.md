.\" Notes on yum
.TH yum pj "14 September 2006"
.SH NAME
yum
.SH "BASIC NAVIGATION"
Do this if you're looking for something:
.PP
.RS
.nf
yum list available '*docbook*'
yum provides '*filename'
yum search whatever

See details about a package:

yum info somepackage

See all the files in a package:

repoquery --list somepackage

See your repositories:

yum repolist

.fi
.RE
.PP

.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth


