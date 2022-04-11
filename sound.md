pavucontrol

# No audio devices

If all your sound devices disappear on Ubuntu (especially after upgrading the kernel), then run this:

    sudo apt-get install linux-modules-extra-`uname -r`

https://askubuntu.com/questions/1230363/internal-speaker-audio-is-not-working-in-ubuntu-20-04-lts-after-upgrading-from/1323133#1323133

# Static

On Linux at random times I get static from any audio playback. It's exactly the symptoms here: https://askubuntu.com/questions/1066565/static-noise-when-playing-sound (staticy, random, lingers). The fix is `pulseaudio -k`.
