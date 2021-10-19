.\" Notes on find
.TH find pj "14 September 2006"
.SH TRICKS
Use -prune to avoid descending into certain directories. For instance, this avoids CVS directories:
.PP
.RS
.nf
find . -name CVS -prune -o -print
.fi
.RE
.PP
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth

