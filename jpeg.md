To shrink jpegs:

```
mkdir dest
jpegoptim -d dest [filenames]
```

Note that originals will be overwritten.

You can use -m0 to -m100 to set the max image quality. (0 makes smaller images, 100 bigger.)

