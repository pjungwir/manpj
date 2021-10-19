## INCANTATIONS

- convert *in* -resize *w*x*h* *out*:

  Resize an image so it fits in a box, preserving scaling.

- convert bob.pdf -resize 100x100 -density 600x600 EPS2:bob.eps:

  Convert a PDF file to an EPS. Density is DPI. Resize is the size *in pixels* of the result. Hence, the size in inches is (resize / density).

- convert *in* -modulate *brightness*,*saturation*,*hue* *out*:

  Adjust the % brightness, saturation, and hue, respectively. Values of 100 leave the qualities unchanged.

## SEE ALSO

convert(1),
ImageMagick(1).
