.\" notes about screen
.TH screen pj "20 January 2012"
.SH NAME
screen

.SH STARTING

Create a new session named \fIname\fR:
.RS
.nf
screen -S \fIname\fR
.fi
.RE

.SH COMMANDS

.TP
.B ^A'
list windows of the current session.

.TP
.B ^A0..9
switch to window 0..0.

.TP
.B ^A^A
switch the last window.

.TP
.B ^Ac
create a new window and open it.

.TP
.B ^A^C
create a new window and open it.

.TP
.B ^Aa
send ^A to the current window.

.TP
.B ^AA
title the current window.

.SH AUTHOR
Written by Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2012 Paul Jungwirth
