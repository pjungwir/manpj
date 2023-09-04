# USAGE

`nc [hostname] [port]` is like telnet: it goes there. But error messages go to stderr, so scripting is easier.

`nc -l [port]` listens. You can still pump data into stdin, and it will go to whoever connects.
This is handy to see what your browser/application is sending.

`-q 0` means quit zero seconds after reading EOF on stdin. That is useful with `-l` if you are just piping something hardcoded.

A complete example:

```
nc -q 0 -l 8011 <<EOF
HTTP/1.1 200 OK
Content-Type: text/plain

hello world!
EOF
```
