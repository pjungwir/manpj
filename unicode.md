# UTF-8
This chart shows how to convert between Unicode and UTF-8 (from the Unicode 2.0 spec):

```
Unicode                                     UTF-8
1st Byte  2nd Byte      1st Byte    2nd Byte    3rd Byte    4th Byte
0000 0000 0xxx xxxx     0xxx xxxx   
0000 0yyy yyxx xxxx     110y yyyy   10xx xxxx
zzzz yyyy yyxx xxxx     1110 zzzz   10yy yyyy   10xx xxxx
1101 10ww wwzz zzyy +   1111 0uuu   10uu zzzz   10yy yyyy   10xx xxxx
1101 11yy yyxx xxxx     (uuuuu = wwww + 1)
```

# BYTE ORDER MARKS
Here's the deal with byte-order marks (BOMs) in the various flavors of Unicode:

- 00 00 FE FF:
UCS-4, big-endian (aka UTF-32)

- FF FE 00 00:
UCS-4, little-endian (aka UTF-32)

- FE FF:
Unicode, big-endian (aka UTF-16)

- FF FE:
Unicode, little-endian (aka UTF-16)

- EF BB BF:
UTF-8

- 0F FE FF:
UTR-6 (compressed Unicode)
