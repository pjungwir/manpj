## SYNOPSIS

Handy utilities, scripts, or other things I need to remember.

## COMMANDS

*cam2web* [*files....*]
Convert big camera images to small web images. This is a bash function defined in ~/lib/camera.sh.

*rotate* [-o] [*files...*|-]
Losslessly rotate an image clockwise 90 degrees. This is another bash function defined in ~/lib/camera.sh.

- gphoto2:
  A CLUI app for using a digital camera. Some good options:

```
gphoto2 --list-ports
gphoto2 --auto-detect
gphoto2 --summary
gphoto2 --list-files
gphoto2 --get-all-files
gphoto2 --delete-all-files
```

- xnview -browser:
  A very fast, nice GUI for navigating files. Renaming is easy. You can't rotate in browse mode, which is a little annoying. Makes nice web thumbnails, along with an html page.

- flphoto:
  A okay GUI to grab and adjust images. Sadly there is no easy way to rename the image files, and it doesn't have color editing.

- gtkam:
  A GUI that just downloads images. Not too useful. I couldn't get this to compile with EXIF support, unlike libgphoto2 and gphoto2, because libexif-gtk has issues.

- convert *in* -modulate 100,110,100 *out*:
  This adjusts brightness, saturation, and hue. Here we're booting saturation 10%.

- convert *in* -resize 200x200 *out*:
  This is a good size for web images.

- convert *in* -resize 400x400 *out*:
  This is a good size for on-screen viewing.

- jpegtran -rotate 90 -trim *in* >*out*:
  Losslessly rotates, except -trim will shave off a pixel or two along the edge. But that is better than leaving it there!

## NOTES

kernel 2.4.18 segfaults libgphoto2, so you might want to upgrade.

Your camera must be set up in /etc/hotplug/usb.usermap. You can run /usr/local/lib/libgphoto2/print-usb-usermap to fill that file. If your camera is missing, you won't gain ownership to the USB device when the camera is plugged in. Ownership is granted by /etc/hotplug/usb/usbcam. libphoto2 comes with various implementations for that script; the best seems to be granting ownership to the console owner.

## SEE ALSO

jpegtran(1),
convert(1),
ImageMagick(1).
