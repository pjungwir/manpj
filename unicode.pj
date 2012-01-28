.TH unicode pj "4 July 2005"
.SH NAME
Unicode Notes
.SH UTF-8
This chart shows how to convert between Unicode and UTF-8 (from the Unicode 2.0 spec):
.PP
.nf
Unicode                                     UTF-8
1st Byte  2nd Byte      1st Byte    2nd Byte    3rd Byte    4th Byte
0000 0000 0xxx xxxx     0xxx xxxx   
0000 0yyy yyxx xxxx     110y yyyy   10xx xxxx
zzzz yyyy yyxx xxxx     1110 zzzz   10yy yyyy   10xx xxxx
1101 10ww wwzz zzyy +   1111 0uuu   10uu zzzz   10yy yyyy   10xx xxxx
1101 11yy yyxx xxxx     (uuuuu = wwww + 1)
.fi
.SH "BYTE ORDER MARKS"
Here's the deal with byte-order marks (BOMs) in the various flavors of Unicode:
.PP
.TP
.B 00 00 FE FF
UCS-4, big-endian (aka UTF-32)
.TP
.B FF FE 00 00
UCS-4, little-endian (aka UTF-32)
.TP
.B FE FF
Unicode, big-endian (aka UTF-16)
.TP
.B FF FE
Unicode, little-endian (aka UTF-16)
.TP
.B EF BB BF
UTF-8
.TP
.B 0F FE FF
UTR-6 (compressed Unicode)
.SH AUTHOR
Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
