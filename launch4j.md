.\" Notes on launch4j
.TH launch4j pj "14 September 2006"
.SH NAME
launch4j
.SH NOTES
The headerType element does not take "gui" and "console" as the docs say, but "0" (for gui) and "1" (for console).

The cmdLine element is invalid.

The classPath element is invalid--and not required.

If you give launch4j an executable jar, you don't need to specify the main class.

.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth


