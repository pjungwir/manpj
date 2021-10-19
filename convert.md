.\" Notes about ImageMagick
.TH convert pj "2 July 2005"
.SH NAME
convert
.SH INCANTATIONS
.TP
.B convert \fIin\fR -resize \fIw\fRx\fIh\fR \fIout\fR
Resize an image so it fits in a box, preserving scaling.
.TP
.B convert bob.pdf -resize 100x100 -density 600x600 EPS2:bob.eps
Convert a PDF file to an EPS. Density is DPI. Resize is the size \fIin pixels\fR of the result. Hence, the size in inches is (resize / density).
.TP
.B convert \fIin\fR -modulate \fIbrightness\fR,\fIsaturation\fR,\fIhue\fR \fIout\fR
Adjust the % brightness, saturation, and hue, respectively. Values of 100 leave the qualities unchanged.
.SH AUTHOR
Paul Jungwirth
.SH "SEE ALSO"
convert(1),
ImageMagick(1).

