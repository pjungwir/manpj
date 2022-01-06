# USAGE

`nc [hostname] [port]` is like telnet: it goes there. But error messages go to stderr, so scripting is easier.

`nc -l [port]` listens. You can still pump data into stdin, and it will go to whomever connects.
This is handy to see what your browser/application is sending.
