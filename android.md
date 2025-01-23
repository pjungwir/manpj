To get photos off the phone:

- Plug in the phone.
- Browse it with the Xubuntu file UI. (You might need to click Allow Access on your phone.)
- Go to `Internal Storage/DCIM` and copy the `Camera` folder (don't click into it!).
- Paste it into a date folder in ~/Pictures/android-s3-photos.

If someone else texts you a photo, you can save it to internal storage.
Then to copy it to the desktop, you can get it from `Internal Storage/Pictures/Messages`

I really need to find a cli way to do this, so that I don't have to copy *everything* just to get the last month or so of pictures!

# CLI

First enable USB debugging with [these instructions](https://developer.android.com/studio/debug/dev-options):

- Find a page in Settings named something like "About Phone".
- Click on the Build Number seven times (seriously??).
- At the bottom of Settings you'll now see a Developer Settings section.
- In there turn on USB Debugging.

Now:

```
sudo apt install adb
adb devices -l  # You might need to click Allow on the phone first
adb -d shell ls /sdcard/DCIM/Camera/202409* | xargs -i adb pull {} .
adb -d shell ls /sdcard/Pictures/Messages/* | xargs -i adb pull {} .
```
