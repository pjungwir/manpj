# GENERAL
Use lame to convert wav to mp3 files. Use xmms to play mp3 files.

To convert from wma (Windows Media Player) to wav, run this command:

```
mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader ${f}.wma && mv audiodump.wav ${f}.wav
```

The same command will rip the audio from any file that mplayer can read. You can even use it to extract audio from movies.

To convert from mp3 to wav, do this:

```
lame -h --decode ${f}.mp3 ${f}.wav
```
