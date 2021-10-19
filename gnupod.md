.TH Gnupod pj "18 November 2005"
.SH NAME
Gnupod
.SH INDEX
Use gnupod to manage your ipod.
.SH DESCRIPTION
If you are starting with .wav files, first you must convert them to .mp3s:
.PP
.RS
.nf
lame -h \fIfilename\fR.wav \fIfilename\fR.mp3
.fi
.RE
.PP
Next you add them to the gnupod database, a special file stored on the ipod:
.PP
.RS
.nf
gnupod_addsong.pl \fIfilename\fR.mp3 \fI...\fR
.fi
.RE
.PP
Finally, rebuild the proprietary ipod database:
.PP
.RS
.nf
mktunes.pl
.fi
.RE
.PP
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth


