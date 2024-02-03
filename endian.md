Big endian means the most significant values are stored first.

Little endian means the least significant values are stored first.

They are about *byte order* not *bit order*.
In all cases, the most significant bits within each byte come first.

x86 is little endian.

So take a UTF-8 Byte Order Mark (BOM). It stores the unicode value u+feff.

In a big-endian system, it is stored feff.

In a little-endian system, it is stored fffe.

But in UTF-8 it is stored efbbbf.
In UTF-8 you only have individual bytes, so endianness has no effect.



