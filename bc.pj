.\" Tips on bc variables
.TH bc pj "3 July 2005"
.SH NAME
bc Tips
.SH DESCRIPTION
.PP
To change the number of decimal places you see, do this:
.PP
.RS
.nf
scale=5
.fi
.RE
.PP
ibase and obase determine the "input base" and the "output base," so you can use them to do conversions. See them like this:
.PP
.RS
.nf
obase
10
ibase
10
.fi
.RE
.PP
Set them like this:
.PP
.RS
.nf
ibase=2
ibase
2
ibase=1010
ibase
10
obase=8
obase
10
.fi
.RE
.PP
Why does obase say 10, when it should be 8? Well, because you set the output base to 8, and 10 octal is 8 decimal. Crazy, huh? I suppose displaying the value of obase always yields 10.
.PP
So pretend you want to convert from octal to binary. Do this:
.PP
.RS
.nf
obase=2
ibase=8
357
11101111
.fi
.RE
.PP
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth

