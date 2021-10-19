## INDEX

Use gnupod to manage your ipod.

## DESCRIPTION

If you are starting with .wav files, first you must convert them to .mp3s:

```
lame -h *filename*.wav *filename*.mp3
```

Next you add them to the gnupod database, a special file stored on the ipod:

```
gnupod_addsong.pl *filename*.mp3 *...*
```

Finally, rebuild the proprietary ipod database:

```
mktunes.pl
```
