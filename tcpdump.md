.TH tcpdump pj "4 July 2005"
.SH NAME
tcpdump Notes
.SH SYNOPSIS
.B /usr/sbin/tcpdump
[\fIoptions\fR] [\fIexpression\fR]
.SH DESCRIPTION
So the man page has pretty much all you need, but here are the most useful options:
.TP
.B -i \fIinterface\fR
Sets the interface to listen on, e.g. eth0 or wlan0. Defaults to eth0.
.TP
.B -s \fIn\fR
Sets the size of packets. If you say "-s 0," tcpdump will grab the entire packet.
.TP
.B -xX
Print the packet data in hex and ascii. (x = hex, X = ascii)
.TP
.B -w \fIf\fR
Write the packets to file \fIf\fR. You can say "-w myfile -w -" to get a "tee" effect.
.TP
.B -r \fIf\fR
Read the packets from file \fIf\fR.
.TP
.B -p
Don't use promiscuous mode. This can simplify your rules to avoid noise and also may let you run this without root privileges (not sure about that though).
.PP
For an expression, your probably want something like this:
.PP
.RS
\&'host remote.site.com'
.RE
.PP
You can limit the noise to just one protocol like this:
.PP
.RS
\&'host remote.site.com && port 80'
.RE
.PP
You can limit direction like this:
.PP
.RS
\&'dst host remote.site.com && port 80'
.br
or
.br
\&'host remote.site.com dst && port 80'
.RE
.PP
You can combine expressions with not, and, or, and parentheses. You can pass the expression as several arguments or a single argument, so for complex expressions with parens you may want to just quote the whole thing.
.PP
Here's a full example:
.RS
tcpdump -s 0 -xX -w http -w - 'host hendrix && port 910'
.RE
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
