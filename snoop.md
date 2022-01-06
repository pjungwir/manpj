# DESCRIPTION

Snoop is like tcpdump but for solaris. Here is a good command:

```
snoop -r -x 0 'host 169.207.238.110'
```

- `-r`:
  don't resolve ip addresses

- `-x 0`:
  show ascii & hex packet data, starting at the 0th byte of the packet.
