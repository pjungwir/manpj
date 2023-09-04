On Ubuntu you can install fail2ban like this:

```
sudo apt update
sudo apt install fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

Customize it by putting things in `/etc/fail2ban/jail.local`.
For example:

```
[DEFAULT]
bantime = 10m
findtime = 10m
maxretry = 5
destemail = root@localhost
sender = once@9stmaryrd.com
mta = sendmail

[postfix-sasl]
enabled = true
filter = postfix-sasl
logpath = /var/log/mail.log

[sshd]
port = 22,2777
```

Then in `/etc/fail2ban/filter.d/postfix-sasl.conf` you can have:

```
[INCLUDES]
before = common.conf

[Definition]
_daemon = postfix(-\w+)?/\w+(?:/smtp[ds])?
# For example, match this:
# Apr  4 14:52:59 www postfix/submission/smtpd[993587]: warning: unknown[91.224.92.22]: SASL LOGIN authentication failed: UGFzc3dvcmQ6
failregex = ^%(__prefix_line)swarning: [-._\w]+\[<HOST>\]: SASL ((?i)LOGIN|PLAIN|(?:CRAM|DIGEST)-MD5) authentication failed(: [ A-Za-z0-9+/:]*={0,2})?\s*$
```

You can make sure it's working like this:

```
sudo fail2ban-regex /var/log/mail.log /etc/fail2ban/filter.d/postfix-sasl.conf
sudo fail2ban-client status sshd
sudo fail2ban-client status postfix
sudo iptables -S
```
