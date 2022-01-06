# INSTALL

For good install instructions, see my notes about Upgrading to Fedora Core 5.

# UPDATE

Any time yum updates the kernel, you need to reinstall ndiswrapper.
Just go to ~pjungwir/src/ndiswrapper-1.23 and run "make install."
Then run "modprobe ndiswrapper."
You should get connectivity without having to reboot.

You also need to reinstall the Cisco vpnclient. That is something like this:

```
cd ~pjungwir/src/vpnclient
./driver_build.sh /usr/src/kernels/2.6.17-1.2187_FC5-i686/	\" \& is a non-printable, zero-width char
./vpn_install
chmod 4111 /opt/cisco-vpnclient/bin/cvpnd
service vpnclient_init start
```
