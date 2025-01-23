To see my notes on querying the munin database via the CLI, see rrdtool(pj).

# Email notifications

https://unix.stackexchange.com/questions/182067/how-to-check-easily-the-munin-alert-email-notification

Test configuration:

```
sudo -u munin /usr/share/munin/munin-update --debug
```

Test a specific plugin:

```
sudo munin-run df config
sudo munin-run df
```

Send a notification:

```
sudo -u munin /usr/share/munin/munin-limits --contact pj@illuminatedcomputing.com --force
```

Set up in /etc/munin/munin-conf.d/alerts:

```
contact.pjungwir.command mail -s "Munin ${var:worst}: ${var:group}::${var:host}::${var:plugin}" pj@illuminatedcomputing.com
contact.pjungwir.max_messages 1

[tal]
```

