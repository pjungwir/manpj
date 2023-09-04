Lots of good tips [here](https://ro-che.info/articles/2017-07-21-record-audio-linux) including how to record from a specific application and send the app's audio to your speakers/headphone at the same time.

List the available audio input devices:

```
pacmd list-sources | egrep '^\s+name: .*alsa_input'
```

Start recording from one of them:

```
parecord --channels=1 -d alsa_input.usb-0c76_USB_PnP_Audio_Device-00.analog-stereo alphabet-operetta.wav
```

TODO: How to record both an application and your microphone at the same time (e.g. for streaming)? It seems like that link has the tools I need to figure it out.
