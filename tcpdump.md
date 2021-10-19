## SYNOPSIS

/usr/sbin/tcpdump [*options*] [*expression*]

## DESCRIPTION

So the man page has pretty much all you need, but here are the most useful options:

- -i *interface*:
  Sets the interface to listen on, e.g. eth0 or wlan0. Defaults to eth0.

- -s *n*:
  Sets the size of packets. If you say "-s 0," tcpdump will grab the entire packet.

- -xX:
  Print the packet data in hex and ascii. (x = hex, X = ascii)

- -w *f*:
  Write the packets to file *f*. You can say `-w myfile -w -` to get a "tee" effect.

- -r *f*:
  Read the packets from file *f*.

- -p
  Don't use promiscuous mode. This can simplify your rules to avoid noise and also may let you run this without root privileges (not sure about that though).

For an expression, your probably want something like this:

```
host remote.site.com
```

You can limit the noise to just one protocol like this:

```
host remote.site.com && port 80
```

You can limit direction like this:

```
dst host remote.site.com && port 80
```

or

```
host remote.site.com dst && port 80
```

You can combine expressions with not, and, or, and parentheses. You can pass the expression as several arguments or a single argument, so for complex expressions with parens you may want to just quote the whole thing.

Here's a full example:

```
tcpdump -s 0 -xX -w http -w - 'host hendrix && port 910'
```
