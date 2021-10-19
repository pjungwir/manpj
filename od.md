# DESCRIPTION

- od --format=ax1 *filename*

  This gives you both characters (a) and hex (x1). Hex values are 1-byte long.
  If you don't specify the 1, you get endian weirdness.

- od --format=cz *filename*

  This is a bit easier to read.
