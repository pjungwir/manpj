.\" Notes on nc
.TH nc pj "14 September 2006"
.SH NAME
nc (netcat)
.SH USAGE
nc [hostname] [port] is like telnet: it goes there. But error messages go to stderr, so scripting is easier.
.P
nc -l [port] listens. You can still pump data into stdin, and it will go to whomever connects.
This is handy to see what your browser/application is sending.

.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth


