hdiutil - Apple's built-in tool for creating/burning/mounting ISO disk images
HandBrake - Use this to easily rip DVDs' episodes, but not menus etc.
VLC - Use this to do other weird things with DVDs or movie files, like convert their formats.
Fairmount - Remounts DVDs as decrypted.
DVDRemaster - Commercial program sold by the Fairmount people; apparently similar to DVD2One.
MacTheRipper - Free until 2.6.6, then commercial. The free version is spyware and ineffective against disks after 2005.
DVD2OneX - Commercial utility (with 30-day trial) useful in combination with Fairmount to create whole DVDs.
ffmpegX - creates DVD image files from VIDEO_TS & AUDIO_TS folders.

Best process to rip a whole DVD:
(not recommended on any website, but if Fairmount really mounts the DVD w/o copyright, shouldn't it work?)

1. Run Fairmount
2. Insert the DVD
3. Run the Disk Utility program, select the DVD (not the drive), and click the New Image button.
4. For "Image Format," choose "DVD/CD master."
5. Still in Disk Utility, select the resulting disk image and click Burn.

You may include an intermediate step 2.5: copy the DVD to your hard drive. You can play it off your hard drive by pointing the Apple DVD Player at the VIDEO_TS folder.

But there are two problems with this workflow. First, consumer blank DVDs only hold 4.7 GB, so you must remaster the video to fit. You can use DVD2One for this, perhaps also Handbrake or VLC. Second, the DVD may break the standard as a means of copy protection, and this can confuse your software (your burner, I think). DVD2One can also help you correct these standards violations.

On Linux, use ffmpeg:

cat /media/paul/name-of-the-dvd/VIDEO_TS/VTS_01_*VOB | ffmpeg -i - -s 720x576 -c:v mpeg4 -c:a mp3 -qmin 1 -qmax 3 -b:a 256k -b:v 4000k -y name-of-the-dvd.avi

