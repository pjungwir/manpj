.\" notes about burning audio and data cds
.TH cd pj "3 August 2005"
.SH NAME
Burning CDs
.SH GENERAL
You can learn the scsi numbers of your cd recorder with this command:
.PP
.RS
.nf
cdrecord -scanbus
.fi
.RE
.PP
You must be root to run that command.
.SH AUDIO
First, get the audio off the CD into wav files:
.PP
.RS
.nf
for n in `~pjungwir/bin/range 1 32`; do
    cdda2wav -D /dev/cdrom -t $n track$n.wav;
done;
.fi
.RE
.PP
This command assumes you have less than 32 tracks on the CD. As soon as you grab a track, cdda2wav will show you the total number of tracks you need.
.PP
Next convert the wav files into cdr files:
.PP
.RS
.nf
for n in `~pjungwir/bin/range 1 32`; do
    sox track$n.wav track$n.cdr;
done;
.fi
.RE
.PP
Finally, burn it to a CD:
.PP
.RS
.nf
cdrecord -v dev=/dev/hdc speed=2 -audio `ls -tr track*.cdr`
.fi
.RE
.PP
or:
.PP
.RS
.nf
cdrecord -v dev=/dev/hdc speed=2 -audio \\
$(for n in `~pjungwir/bin/range 1 32`; do echo track$n.cdr; done)
.fi
.RE
.PP
Add the blank=all option if you're using a cdrw disk that already has data.
.SH DATA
To create a data cd, first create the cd image:
.PP
.RS
.nf
mkisofs -r -o cd_image source_directory
.fi
.RE
.PP
You can use -R instead of -r for RockRidge extensions
with different permissions.
-J gives you Joliet filenames in addition to the ISO9660 filenames.
-l uses 32-character filenames instead of 8.3 filenames.
.PP
Burn the cd like this:
.PP
.RS
.nf
cdrecord -v speed=2 dev=/dev/hdc -data cd_image
.fi
.RE
.PP
Again, use blank=all if you're writing to a used cdrw disk.
.SH RIPPING
To pull an ISO image off a CD, do something like this:
.PP
.RS
.nf
dd if=/dev/cdrom of=image.iso
.fi
.RE
.PP
.SH AUTHOR
Written by Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2005 Paul Jungwirth
