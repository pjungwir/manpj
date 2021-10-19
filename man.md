.\" BLAH BLAH
.TH man pj "2 July 2005"
.SH NAME
Writing man Pages
.SH SYNOPSIS
Writing a man page is not hard!
.SH DESCRIPTION
.PP
Here are some macros you might use:
.TP
.B .TH \fIcommand-name\fR \fIman-section\fR \fIdate\fR
\fITitle header.\fR This text will appear in the header and footer of the resulting man page. If any of the arguments contain spaces, you'll need to quote them or \\  (backslash + space).
.TP
.B .SH \fIname\fR
\fISection header.\fR Usually section names are written in caps. See below for a recommended list of sections.
.RS
.IP NAME
The name of whatever you're documenting: a binary, a file, sometimes a concept.
.IP SYNOPSIS
A one-liner. For commands, this should show their parameterized form, like this:
.RS
.PP
.B whizprog
[
.I options
] [
.I files
\&... ]
.RE
.IP DESCRIPTION
More detailed description of your topic. Often you'll include a list of options here.
.IP BUGS
Any bugs you know about, plus some way users can report new ones.
.IP AUTHOR
The author of the documented thing, or perhaps the manpage itself. Beats me!
.IP COPYRIGHT
A copyright statement, so people know if it is free as in speech or free as in beer.
.IP "SEE ALSO"
Any references to other documentation.
.RE
.TP
.B .TP [\fIwidth\fR]
\fITabbed paragraph?\fR Whatever it stands for, it's a hanging indent. The next line will hang, and following lines will be indented. This is useful for listing options. Usually the options appear in bold (.B) and parameter names in italics \\fI\fIblah\fR\\fR. You use \\fI to set an italic font and \\fR to set a roman font.
.TP
.B .IP \fItag\fR [\fIwidth\fR]
\fIIndented paragraph.\fR This is also a hanging indent, but unlike .TP, it reads the hanging line as its next argument. This is good when all your hanging tags are single words.
.TP
.B .RS
\fIRelative indent start.\fR This is good for nested lists.
.TP
.B .RE
\fIRelative indent end.\fR You should have one of these for every .RS.
.TP
.B .nf
\fINo formatting.\fR Sort of like the HTML <pre> tag.
.TP
.B .fi
\fIFormat again.\fR
.TP
.B .PP
\fIParagraph.\fR Nothing fancy. You could also use .P or .LP for the same thing.
.TP
.B .br
\fILine break.\fR Start a new line without inter\-paragraph spacing.
.TP
.B \\\\\&&.
\fIA literal period at the beginning of a line.\fR
.SH AUTHOR
Written by Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
