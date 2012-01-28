.\" notes about mp3 files
.TH mp3 pj "11 February 2006"
.SH NAME
MP3 Files
.SH GENERAL
Use lame to convert wav to mp3 files. Use xmms to play mp3 files.
.PP
To convert from wma (Windows Media Player) to wav, run this command:
.PP
.RS
.nf
mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader ${f}.wma && mv audiodump.wav ${f}.wav
.fi
.RE
.PP
The same command will rip the audio from any file that mplayer can read. You can even use it to extract audio from movies.
.PP
To convert from mp3 to wav, do this:
.PP
.RS
.nf
lame -h --decode ${f}.mp3 ${f}.wav
.fi
.RE
.SH AUTHOR
Written by Paul Jungwirth
.SH COPYRIGHT
Copyright \(co 2006 Paul Jungwirth
