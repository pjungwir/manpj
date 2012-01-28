.\" Notes about using my digital camera.
.TH camera pj "2 July 2005"
.SH NAME
Digital Camera Notes
.SH SYNOPSIS
Handy utilities, scripts, or other things I need to remember.
.SH COMMANDS
.TP
\fBcam2web\fR [\fIfiles....\fR]
Convert big camera images to small web images. This is a bash function defined in ~/lib/camera.sh.
.TP
\fBrotate\fR [-o] [\fIfiles...\fR|-]
Losslessly rotate an image clockwise 90 degrees. This is another bash function defined in ~/lib/camera.sh.
.TP
.B gphoto2
A CLUI app for using a digital camera. Some good options:
.RS
.TP
gphoto2 --list-ports
.TP
gphoto2 --auto-detect
.TP
gphoto2 --summary
.TP
gphoto2 --list-files
.TP
gphoto2 --get-all-files
.TP
gphoto2 --delete-all-files
.RE
.TP
.B xnview -browser
A very fast, nice GUI for navigating files. Renaming is easy. You can't rotate in browse mode, which is a little annoying. Makes nice web thumbnails, along with an html page.
.TP
.B flphoto
A okay GUI to grab and adjust images. Sadly there is no easy way to rename the image files, and it doesn't have color editing.
.TP
.B gtkam
A GUI that just downloads images. Not too useful. I couldn't get this to compile with EXIF support, unlike libgphoto2 and gphoto2, because libexif-gtk has issues.
.TP
.B convert \fIin\fR -modulate 100,110,100 \fIout\fR
This adjusts brightness, saturation, and hue. Here we're booting saturation 10%.
.TP
.TP
.B convert \fIin\fR -resize 200x200 \fIout\fR
This is a good size for web images.
.TP
.B convert \fIin\fR -resize 400x400 \fIout\fR
This is a good size for on-screen viewing.
.B jpegtran -rotate 90 -trim \fIin\fR >\fIout\fR
Losslessly rotates, except -trim will shave off a pixel or two along the edge. But that is better than leaving it there!
.SH NOTES
kernel 2.4.18 segfaults libgphoto2, so you might want to upgrade.
.P
Your camera must be set up in /etc/hotplug/usb.usermap. You can run /usr/local/lib/libgphoto2/print-usb-usermap to fill that file. If your camera is missing, you won't gain ownership to the USB device when the camera is plugged in. Ownership is granted by /etc/hotplug/usb/usbcam. libphoto2 comes with various implementations for that script; the best seems to be granting ownership to the console owner.
.SH AUTHOR
Paul Jungwirth
.SH "SEE ALSO"
jpegtran(1),
convert(1),
ImageMagick(1).
