Run this as root to see what networks are out there:

# iwlist wlan0 scanning

For the meaning of parameters in /etc/sysconfig/network-scripts/ifcfg-wlan0, see ifup-wireless and the man page for iwconfig.

# debian 12

I don't seem to have a working panel applet, but I was able to connect with this:

```
nmcli device wifi connect squirrelsite
```
